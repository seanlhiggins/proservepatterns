explore: criteo_pop_pattern {}
view: criteo_pop_pattern {
  sql_table_name: public.order_items ;;

  measure: total_revenue {
    sql: ${TABLE}.sale_price ;;
    type: sum
    value_format_name: usd
  }

  dimension_group: day {
    hidden: yes
    type: time
    timeframes: [raw,date,week,month]
    sql: ${TABLE}.created_at ;;
  }
  dimension: today {
    hidden: yes
    sql: CURRENT_DATE ;;
  }

  ### PARAMETERS ###{

  parameter: time_aggregation_selector {
    description: "Time aggregation selector"
    default_value: "Day"
    suggestions: ["Day","Week","Month"]
    allowed_value: {
      label: "Day"
      value: "Day"
    }
    allowed_value: {
      label: "Week"
      value: "Week"
    }
    allowed_value: {
      label: "Month"
      value: "Month"
    }
  }

  parameter: period_comparison_type {
    description: "Period comparison type"
    default_value: "Previous period"
    suggestions: ["Previous period","Same period previous year"]
    allowed_value: {
      label: "Previous period"
      value: "Previous period"
    }
    allowed_value: {
      label: "Same period previous year"
      value: "Same period previous year"
    }
    allowed_value: {
      label: "Custom period"
      value: "Custom period"
    }
  }

  parameter: period_selection {
    description: "Selection of the main period for the analysis"
    default_value: "Last 7 days"
    suggestions: [,"Yesterday","This week","Last week", "Last 7 days", "Last 14 days","Last 30 days", "This month", "Last month", "This quarter", "Last quarter", "This year","Last year"]
#    "Today"
#     allowed_value: {
#       label: "Today"
#       value: "Today"
#     }
    allowed_value: {
      label: "Yesterday"
      value: "Yesterday"
    }
    allowed_value: {
      label: "This week"
      value: "This week"
    }
    allowed_value: {
      label: "Last week"
      value: "Last week"
    }
    allowed_value: {
      label: "Last 7 days"
      value: "Last 7 days"
    }
    allowed_value: {
      label: "Last 14 days"
      value: "Last 14 days"
    }
    allowed_value: {
      label: "Last 30 days"
      value: "Last 30 days"
    }
    allowed_value: {
      label: "This month"
      value: "This month"
    }
    allowed_value: {
      label: "Last month"
      value: "Last month"
    }
    allowed_value: {
      label: "This quarter"
      value: "This quarter"
    }
    allowed_value: {
      label: "Last quarter"
      value: "Last quarter"
    }
    allowed_value: {
      label: "This year"
      value: "This year"
    }
    allowed_value: {
      label: "Last year"
      value: "Last year"
    }
    allowed_value: {
      label: "Custom period"
      value: "Custom period"
    }
  }
  ###}

### DYNAMIC DIMENSIONS {
  dimension: previous_period {
    label: "Period status (Pivot me!)"
    type: string
    description: "Makes the difference between main period and comparison period"
    sql:
    {% if  period_selection._parameter_value  ==  "'Today'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} =  ${today}
                      THEN 'Current Period'
              WHEN ${day_date} =  ${today}-1
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} =  ${today}
                  THEN 'Current Period'
          WHEN ${day_date} =  DATEADD(year,-1*(1) ,${today})
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} =  ${today}
                  THEN 'Current Period'
          WHEN ${day_date} =  {% date_start custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Yesterday'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} =  ${today}-1
                      THEN 'Current Period'
              WHEN ${day_date} =  ${today}-2
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} =  ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} =  DATEADD(year,-1*(1) ,${today}-1)
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} =  ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} =  {% date_start custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This week'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  date_trunc('week',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD('week',-1 ,date_trunc('week',${today}))
                      AND ${day_date} < DATEADD('week',-1,${today})
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  date_trunc('week',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('week',${today}))
                      AND ${day_date} < DATEADD(year,-1*(1) ,${today})
                      THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  date_trunc('week',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN 'Previous Period'
          END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last week'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD('week',-1 ,DATEADD(week,-1*(1), date_trunc('week',${today})))
                      AND ${day_date} < DATEADD(week,-1*(1), date_trunc('week',${today}))
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
         WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,DATEADD(week,-1*(1), date_trunc('week',${today})))
                      AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('week',${today}))
                      THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
         WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN 'Previous Period'
          END
      {% else  %}
          NULL
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last 7 days'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  ${today}-7
                      AND ${day_date} <= ${today}-1
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD(day,-1*7 ,${today}-7)
                      AND ${day_date} < ${today}-7
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-7
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-7)
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-7
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last 14 days'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  ${today}-14
                      AND ${day_date} <= ${today}-1
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD(day,-1*14 ,${today}-14)
                      AND ${day_date} < ${today}-14
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-14
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-14)
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-14
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last 30 days'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  ${today}-30
                      AND ${day_date} <= ${today}-1
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD(day,-1*30 ,${today}-30)
                      AND ${day_date} < ${today}-30
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-30
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-30)
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  ${today}-30
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This month'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >=  date_trunc('month',${today})
                      AND ${day_date} <= ${today}-1
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD('month',-1 ,date_trunc('month',${today}))
                      AND ${day_date} < DATEADD('month',-1,${today})
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  date_trunc('month',${today})
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('month',${today}))
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  date_trunc('month',${today})
                  AND ${day_date} <= ${today}-1
                  THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last month'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >= DATEADD(month,-1*(1), date_trunc('month',${today}))
                      AND ${day_date} < date_trunc('month',${today})
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD(month,-1*(2), date_trunc('month',${today}))
                      AND ${day_date} < DATEADD(month,-1*(1), date_trunc('month',${today}))
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  DATEADD(month,-1*(1), date_trunc('month',${today}))
                  AND ${day_date} < date_trunc('month',${today})
                  THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,DATEADD(month,-1*(1), date_trunc('month',${today})))
                    AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('month',${today}))
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  DATEADD(month,-1*(1), date_trunc('month',${today}))
                  AND ${day_date} < date_trunc('month',${today})
                  THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This quarter'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >= date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD('quarter',-1,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD('quarter',-1,${today})
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >= date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('quarter',${today}))
                    AND ${day_date} < DATEADD(year,-1*(1) ,${today})
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >= date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last quarter'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >= DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} <date_trunc('quarter',${today})
                      THEN 'Current Period'
              WHEN ${day_date} >=DATEADD(quarter,-2,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD(quarter,-1*1, date_trunc('quarter',${today}))
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >= DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} < date_trunc('quarter',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('quarter',DATEADD(quarter,-1,date_trunc('quarter',${today}))))
                    AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('quarter',${today}))
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >= DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} < date_trunc('quarter',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This year'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >= date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
              WHEN ${day_date} >=  DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD('year',-1,${today})
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >= date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('year',${today}))
                    AND ${day_date} < DATEADD(year,-1*(1) ,${today})
                    THEN 'Previous Period'
          END
       {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >= date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN 'Current Period'
          WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last year'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
        CASE
              WHEN ${day_date} >= DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} <date_trunc('year',${today})
                      THEN 'Current Period'
              WHEN ${day_date} >=DATEADD('year',-2,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD('year',-1*1, date_trunc('year',${today}))
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >= DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} < date_trunc('year',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('year',DATEADD('year',-1,date_trunc('year',${today}))))
                    AND ${day_date} < DATEADD('year',-1*(1) ,date_trunc('year',${today}))
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >= DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} < date_trunc('year',${today})
                      THEN 'Current Period'
          WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                      AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Custom period'"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
         CASE
              WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN 'Current Period'
              WHEN ${day_date} >= DATEADD(day,-1*(1+DATEDIFF(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) , {% date_start custom_date_filter %})
                      AND ${day_date} < {% date_start custom_date_filter %}
                      THEN 'Previous Period'
              END
      {% elsif  period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
      CASE
          WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                      THEN 'Current Period'
         WHEN ${day_date} >=  DATEADD('year',-1,{% date_start custom_date_filter %})
                      AND ${day_date} <= DATEADD('year',-1, {% date_end custom_date_filter %})
                    THEN 'Previous Period'
          END
      {% elsif  period_comparison_type._parameter_value  ==  "'Custom period'"  %}
      CASE
          WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                      THEN 'Current Period'
         WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN 'Previous Period'
          END
      {% endif %}
    {% endif %}
      ;;
  }

  dimension_group: comparison_day {
    hidden: yes
    description: "DON'T SELECT ME!"
    type: time
    timeframes: [raw,date, day_of_week,week, week_of_year,hour, month, year, month_name]
    sql:
    {% if  period_selection._parameter_value  ==  "'Today'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} =  ${today}
                    THEN ${day_date}
            WHEN ${day_date} =  ${today}-1
                    THEN DATEADD(day,1 ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} =  ${today}
                    THEN ${day_date}
             WHEN ${day_date} =  DATEADD(year,-1*(1) ,${today})
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} =  ${today}
                    THEN ${day_date}
             WHEN ${day_date} = {% date_start custom_previous_date_filter %}
                THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %}, ${today})) ,${day_date})
            END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Yesterday'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} =  ${today}-1
                    THEN ${day_date}
            WHEN ${day_date}=  ${today}-2
                    THEN DATEADD(day,1 ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} =  ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} =  DATEADD(year,-1*(1) ,${today}-1)
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
       {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} =  ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} = {% date_start custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %}, ${today}-1)) ,${day_date})
            END
      {% endif %}
     {% elsif  period_selection._parameter_value  ==  "'This week'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} >=  date_trunc('week',${today})
                    AND ${day_date} < ${today}
                    THEN ${day_date}
            WHEN ${day_date} >=  DATEADD('week',-1 ,date_trunc('week',${today}))
                    AND ${day_date} < DATEADD(week,1,${today})
                    THEN DATEADD('week',1 ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} >=  date_trunc('week',${today})
                    AND ${day_date} < ${today}
                    THEN ${day_date}
             WHEN ${day_date} >=  DATEADD(year,-1*(1) ,date_trunc('week',${today}))
                    AND ${day_date} < DATEADD(year,-1*(1) ,${today})
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=  date_trunc('week',${today})
                    AND ${day_date} < ${today}
                    THEN ${day_date}
             WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},date_trunc('week',${today}))) ,${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last week'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
          WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                    THEN ${day_date}
            WHEN ${day_date} >=  DATEADD('week',-1 ,DATEADD(week,-1*(1), date_trunc('week',${today})))
                      AND ${day_date} < DATEADD(week,-1*(1), date_trunc('week',${today}))
                    THEN DATEADD(week,1 ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                    THEN ${day_date}
             WHEN ${day_date} >= DATEADD('year',-1 ,DATEADD(week,-1*(1), date_trunc('week',${today})))
                      AND ${day_date} < DATEADD('year',-1*(1), date_trunc('week',${today}))
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=  DATEADD(week,-1*(1), date_trunc('week',${today}))
                      AND ${day_date} < date_trunc('week',${today})
                    THEN ${day_date}
             WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},DATEADD(week,-1*(1), date_trunc('week',${today})))) ,${day_date})
            END
    {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last 7 days'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-7
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
            WHEN ${day_date} >=  DATEADD(day,-1*(7) , ${today}-7)
                    AND ${day_date} < ${today}-7
                    THEN DATEADD(day,1*(7) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} >=  ${today}-7
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-7)
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-7
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},${today}-7)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last 14 days'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-14
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
            WHEN ${day_date} >=  DATEADD(day,-1*14 , ${today}-14)
                    AND ${day_date} < ${today}-14
                    THEN DATEADD(day,1*(1+DATEDIFF(day,${today}-14, ${today}-1)) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        CASE
            WHEN ${day_date} >=  ${today}-14
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-14)
                    AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                    THEN DATEADD(year,1*(1) ,${day_date})
            END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-14
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},${today}-14)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'Last 30 days'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
          CASE
              WHEN ${day_date} >=  ${today}-30
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(day,-1*(1+DATEDIFF(day,${today}-30, ${today}-1)) , ${today}-30)
                      AND ${day_date} < ${today}-30
                      THEN DATEADD(day,1*30 ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=  ${today}-30
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) ,${today}-30)
                      AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-30
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
             WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},${today}-30)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "'This month'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >=  date_trunc('month',${today})
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('month',-1 ,date_trunc('month',${today}))
                      AND ${day_date} < DATEADD('month',-1,${today})
                      THEN DATEADD(month,1 ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   date_trunc('month',${today})
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , date_trunc('month',${today}))
                      AND ${day_date} <= DATEADD(year,-1*(1) ,${today}-1)
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
       {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        CASE
            WHEN ${day_date} >=   date_trunc('month',${today})
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
             WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                    THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},date_trunc('month',${today}))),${day_date})
            END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last month'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD(month,-1*(1), date_trunc('month',${today}))
                      AND ${day_date} < date_trunc('month',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(month,-1*(2), date_trunc('month',${today}))
                      AND ${day_date} <  DATEADD(month,-1*(1), date_trunc('month',${today}))
                      THEN DATEADD(day,DATEDIFF(day,DATEADD(month,-2, date_trunc('month',${today})), DATEADD(month,-1, date_trunc('month',${today}))) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   DATEADD(month,-1*(1), date_trunc('month',${today}))
                      AND ${day_date} < date_trunc('month',${today})
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , DATEADD(month,-1*(1), date_trunc('month',${today})))
                      AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('month',${today}))
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=   DATEADD(month,-1*(1), date_trunc('month',${today}))
                      AND ${day_date} < date_trunc('month',${today})
                      THEN ${day_date}
               WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},DATEADD(month,-1*(1), date_trunc('month',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This quarter'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('quarter',-1 ,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD('quarter',-1 ,${today})
                      THEN DATEADD(day,DATEDIFF(day,DATEADD('quarter',-1 ,date_trunc('quarter',${today})), date_trunc('quarter',${today})) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD(year,-1*(1) ,${today})
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=   date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
               WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},date_trunc('quarter',${today}))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last quarter'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} <date_trunc('quarter',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(quarter,-2,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD(quarter,-1*1, date_trunc('quarter',${today}))
                      THEN DATEADD(day,DATEDIFF(day,DATEADD(quarter,-2, date_trunc('quarter',${today})), DATEADD(quarter,-1, date_trunc('quarter',${today}))), ${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} <date_trunc('quarter',${today})
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , DATEADD(quarter,-1,date_trunc('quarter',${today})))
                      AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('quarter',${today}))
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=   DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} <date_trunc('quarter',${today})
                      THEN ${day_date}
               WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},DATEADD(quarter,-1,date_trunc('quarter',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'This year'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('year',-1 ,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD('year',-1 ,${today})
                      THEN DATEADD(day,DATEDIFF(day,DATEADD('year',-1 ,date_trunc('year',${today})), date_trunc('year',${today})) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , date_trunc('year',${today}))
                      AND ${day_date} < DATEADD('year',-1*(1) ,${today})
                    THEN DATEADD(year,1*(1) ,${day_date})
              END
     {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=   date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
               WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},date_trunc('year',${today}))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Last year'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} <date_trunc('year',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('year',-2,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD(quarter,-1*1, date_trunc('year',${today}))
                      THEN DATEADD(day,DATEDIFF(day,DATEADD('year',-2, date_trunc('year',${today})), DATEADD('year',-1, date_trunc('year',${today}))), ${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} <date_trunc('year',${today})
                      THEN ${day_date}
               WHEN ${day_date} >=  DATEADD(year,-1*(1) , DATEADD('year',-1,date_trunc('year',${today})))
                      AND ${day_date} < DATEADD(year,-1*(1) ,date_trunc('year',${today}))
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=  DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} <date_trunc('year',${today})
                      THEN ${day_date}
               WHEN ${day_date} >= {% date_start custom_previous_date_filter %}
                    AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},DATEADD('year',-1,date_trunc('year',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "'Custom period'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN ${day_date}
              WHEN ${day_date} >= DATEADD(day,-1*(1+DATEDIFF(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) , {% date_start custom_date_filter %})
                      AND ${day_date} < {% date_start custom_date_filter %}
                      THEN DATEADD(day,(1+DATEDIFF(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'"  %}
          CASE
              WHEN ${day_date} >=   {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN ${day_date}
               WHEN ${day_date} >=  DATEADD('year',-1,{% date_start custom_date_filter %})
                      AND ${day_date} <= DATEADD('year',-1, {% date_end custom_date_filter %})
                      THEN DATEADD(year,1*(1) ,${day_date})
              END
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'"  %}
          CASE
              WHEN ${day_date} >=   {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN ${day_date}
               WHEN ${day_date} >=  {% date_start custom_previous_date_filter %}
                AND ${day_date} <= {% date_end custom_previous_date_filter %}
                      THEN DATEADD(day,1*(DATEDIFF(day,{% date_start custom_previous_date_filter %},{% date_start custom_date_filter %})),${day_date})
              END
      {% endif %}
    {% endif %}
    ;;
  }

  dimension: time_aggregation {
    description: "Will show 2 dates; Current period and previous period. Format of those dates will be dynamic based on the parameter selections."
    label: "Time Comparison (SELECT ME!)"
    sql:{% if time_aggregation_selector._parameter_value == "'Day'" %}
        ${comparison_day_date}
        {% elsif time_aggregation_selector._parameter_value == "'Week'" %}
        ${comparison_day_week}
        {% elsif time_aggregation_selector._parameter_value == "'Month'" %}
        ${comparison_day_month_name}
        {% endif %};;
    html:
    {% if time_aggregation_selector._parameter_value == "'Day'" or time_aggregation_selector._parameter_value == "'Week'"%}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
          {{rendered_value | date: "%s" | minus : 86400 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
          {{rendered_value | date: "%s" | minus : 604800 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  == "'Last 14 days'" %}
          {{rendered_value | date: "%s" | minus : 1209600 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  ==  "'Last 30 days'"  or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'"  %}
          {{rendered_value | date: "%s" | minus : 2629743 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
          {{rendered_value | date: "%s" | minus : 7889229 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif period_selection._parameter_value  ==  "'Custom period'"  %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% endif %}
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% elsif  period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% elsif  period_selection._parameter_value  == "'Last 14 days'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'Last 30 days'" or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'" or period_selection._parameter_value  ==  "'Custom period'"  %}
          {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %d, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
        {% endif %}
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif  period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif  period_selection._parameter_value  == "'Last 14 days'" %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'Last 30 days'" or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'" %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% elsif  period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'" or period_selection._parameter_value  ==  "'Custom period'"  %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
        {% endif %}
      {% endif %}
    {% elsif time_aggregation_selector._parameter_value == "'Month'" %}
        {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
          {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
            {{rendered_value | date: "%s" | minus : 86400 | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% elsif  period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
            {{rendered_value | date: "%s" | minus : 604800 | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% elsif period_selection._parameter_value  == "'Last 14 days'" %}
            {{rendered_value | date: "%s" | minus : 1209600 | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% elsif period_selection._parameter_value  ==  "'Last 30 days'"  or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'"  %}
            {{rendered_value | date: "%s" | minus : 2629743 | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% elsif period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
            {{rendered_value | date: "%s" | minus : 7889229 | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% elsif period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'"  %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b %Y" | uri_encode}}
          {% elsif period_selection._parameter_value  ==  "'Custom period'"  %}
          {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
          {% endif %}
        {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
          {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  == "'Last 14 days'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'Last 30 days'" or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'"  or period_selection._parameter_value  ==  "'Custom period'" %}
            {{rendered_value | date: "%s" | minus : 31470526 | date: "%b, %Y" | uri_encode}} - {{rendered_value | date: "%s" | date: "%Y" | uri_encode}}
          {% endif %}
        {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
          {% if period_selection._parameter_value  ==  "'Today'" or period_selection._parameter_value  ==  "'Yesterday'" %}
            {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, %Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  == "'Last 7 days'" or period_selection._parameter_value  ==  "'This week'" or period_selection._parameter_value  ==  "'Last week'" %}
            {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, %Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  == "'Last 14 days'" %}
            {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%bd, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, %Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'Last 30 days'" or period_selection._parameter_value  ==  "'This month'" or period_selection._parameter_value  ==  "'Last month'" %}
             {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'This quarter'"  or period_selection._parameter_value  ==  "'Last quarter'" %}
            {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, %Y" | uri_encode}}
          {% elsif  period_selection._parameter_value  ==  "'This year'" or period_selection._parameter_value  ==  "'Last year'"  or period_selection._parameter_value  ==  "'Custom period'" %}
            {{rendered_value | date: "%s" | minus : previous_day_label._value | date: "%b, %Y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, %Y" | uri_encode}}
          {% endif %}
        {% endif %}
    {% else %}
      {{rendered_value}}
    {% endif %}
    ;;

    }

}

### }
