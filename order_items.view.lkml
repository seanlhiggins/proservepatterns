
view: order_items_2 {
  sql_table_name: public.order_items;;
  dimension: user_id {}
#First we create a few parameters. These are going to be default dropdowns to make the explore super simple for users.

  # date filtering parameter, this informs Looker of the period the user wants to analyse with a finite list of options more
  # simplistic than the traditional Looker options e.g. Last 14 Days, This Month
  parameter: period_selection {
    type: unquoted
    description: "Selection of the main period for the analysis"
    default_value: "Last_7_days"
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
      value: "This_week"
    }
    allowed_value: {
      label: "Last week"
      value: "Last_week"
    }
    allowed_value: {
      label: "Last 7 days"
      value: "Last_7_days"
    }
    allowed_value: {
      label: "Last 14 days"
      value: "Last_14_days"
    }
    allowed_value: {
      label: "Last 30 days"
      value: "Last_30_days"
    }
    allowed_value: {
      label: "This month"
      value: "This_month"
    }
    allowed_value: {
      label: "Last month"
      value: "Last_month"
    }
    allowed_value: {
      label: "This quarter"
      value: "This_quarter"
    }
    allowed_value: {
      label: "Last quarter"
      value: "Last_quarter"
    }
    allowed_value: {
      label: "This year"
      value: "This_year"
    }
    allowed_value: {
      label: "Last year"
      value: "Last_year"
    }
    allowed_value: {
      label: "Custom period"
      value: "Custom_period"
    }
  }
  # this allows you to compare either the preceding period, same length OR the same period 1 year ago i.e. Feb vs Jan OR Feb '19 vs Feb '18
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
  # this is the granularity of the dates you will show. So if you select 'Week', the date is going to be rolled up to the weekly grain
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

  # within the above 2 parameters, we have a custom_date option. this is optional, but sometimes you might also want to give users
  # a calendar option so we create the below two filters which get used in the comparison/previous_period dimensions
# Filters {
  filter: custom_date_filter {
    type: date
    hidden: yes
    label: "Custom dates for the analysis"
    description: "Select the custom timeframe of your analysis"

  }


  filter: custom_previous_date_filter {
    type: date
    hidden: yes
    label: "Custom dates for the period over period comparison"
    description: "Select the timeframe for the period over period comparison"
  }
#}
  # we create a dimension named 'today' so we can have a sort of variable we can change in one place but reference in multiple other
  # places.
  dimension: today{
    type:  date
    sql: CURRENT_DATE;;
    convert_tz: no
    hidden: yes
    }

  # this is your main dimension_group e.g. ordered, event, created dates. It's used mostly for filtering and customising the
  # date granularity shown to users.
  dimension_group: day {
    type: time
    sql: ${TABLE}.created_at ;;
    convert_tz: no
    hidden: yes
  }
  # this is the date dimension you'll show in the Explore, we dynamically change the granularity based on the parameter selections
  dimension: time_aggregation {
    label: "Timeframe Breakdown"
    description: "Select for your axis to show the data broken down by day/week/month, depending on your selection from the Time Aggregation Selector"
    sql:{% if time_aggregation_selector._parameter_value == "'Day'" %}
        ${comparison_day_date}
        {% elsif time_aggregation_selector._parameter_value == "'Week'" %}
        ${comparison_day_week}
        {% elsif time_aggregation_selector._parameter_value == "'Month'" %}
        ${comparison_day_month_name}
        {% endif %};;
 # this is complex liquid. We take the difference between the start of the comparison/"Current" period and the start of the "Previous" period
      # and use Liquid to inform the HTML how to render the dates. This way our Tooltip will show the two dates being compared for that datapoint
    html:
    {% if time_aggregation_selector._parameter_value == "'Day'" or time_aggregation_selector._parameter_value == "'Week'"%}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        {{rendered_value | date: "%s" | minus : previous_day_counter._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        {{rendered_value | date: "%s" |  minus:31536000 | date: "%b %d, '%y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "'%y" | uri_encode}}
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        {{rendered_value | date: "%s" | minus : previous_day_counter._value | date: "%b %d" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b %d" | uri_encode}}
      {% endif %}
    {% elsif time_aggregation_selector._parameter_value == "'Month'" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        {{rendered_value | date: "%s" | minus : previous_day_counter._value | date: "%b" | uri_encode}} - {{rendered_value | date: "%s" | date: "%b" | uri_encode}}
      {% elsif period_comparison_type._parameter_value  ==  "'Same period previous year'" %}
        {{rendered_value | date: "%s" |  minus:31536000 date: "%b, '%y" | uri_encode}} - {{rendered_value | date: "%s" | date: "'%y" | uri_encode}}
      {% elsif period_comparison_type._parameter_value  ==  "'Custom period'" %}
        {{rendered_value | date: "%s" | minus : previous_day_counter._value | date: "%b, '%y" | uri_encode}} vs {{rendered_value | date: "%s" | date: "%b, '%y" | uri_encode}}
    {% endif %}
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
    }
  # this _looks_ complex, but is actually just a bunch of interleaved if/else statements to evaluate the
  # correct granularity and comparison types
  dimension_group: comparison_day {
    type: time
    hidden: yes
    timeframes: [raw,date, day_of_week,week, week_of_year,hour, month, year, month_name]
    sql:
    -- if a user wants to look at Today vs Tomorrow, this first bit will be true
    {% if  period_selection._parameter_value  ==  "Today" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} =  ${today}
                    THEN ${day_date}
            WHEN ${day_date} =  ${today}-1
                    THEN DATEADD(day,1 ,${day_date})
            END
    -- if they want to see Today vs same day last year, this second bit will be true
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
                THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %}, ${today})) ,${day_date})
            END
      {% endif %}
    -- and so on and so forth; yesterday vs 2 days ago, then yesterday vs same day a year ago
    {% elsif  period_selection._parameter_value  ==  "Yesterday" %}
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %}, ${today}-1)) ,${day_date})
            END
      {% endif %}
     {% elsif  period_selection._parameter_value  ==  "This_week" %}
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},date_trunc('week',${today}))) ,${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "Last_week" %}
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},DATEADD(week,-1*(1), date_trunc('week',${today})))) ,${day_date})
            END
    {% endif %}

    {% elsif  period_selection._parameter_value  ==  "Last_7_days" %}
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},${today}-7)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "Last_14_days" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
        CASE
            WHEN ${day_date} >=  ${today}-14
                    AND ${day_date} <= ${today}-1
                    THEN ${day_date}
            WHEN ${day_date} >=  DATEADD(day,-1*14 , ${today}-14)
                    AND ${day_date} < ${today}-14
                    THEN DATEADD(day,1*(1+datediff(day,${today}-14, ${today}-1)) ,${day_date})
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},${today}-14)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "Last_30_days" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'" %}
          CASE
              WHEN ${day_date} >=  ${today}-30
                      AND ${day_date} <= ${today}-1
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(day,-1*(1+datediff(day,${today}-30, ${today}-1)) , ${today}-30)
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},${today}-30)),${day_date})
            END
      {% endif %}

    {% elsif  period_selection._parameter_value  ==  "This_month" %}
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
                    THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},date_trunc('month',${today}))),${day_date})
            END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "Last_month" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD(month,-1*(1), date_trunc('month',${today}))
                      AND ${day_date} < date_trunc('month',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(month,-1*(2), date_trunc('month',${today}))
                      AND ${day_date} <  DATEADD(month,-1*(1), date_trunc('month',${today}))
                      THEN DATEADD(day,datediff(day,DATEADD(month,-2, date_trunc('month',${today})), DATEADD(month,-1, date_trunc('month',${today}))) ,${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},DATEADD(month,-1*(1), date_trunc('month',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "This_quarter" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= date_trunc('quarter',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('quarter',-1 ,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD('quarter',-1 ,${today})
                      THEN DATEADD(day,datediff(day,DATEADD('quarter',-1 ,date_trunc('quarter',${today})), date_trunc('quarter',${today})) ,${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},date_trunc('quarter',${today}))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "Last_quarter" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD(quarter,-1,date_trunc('quarter',${today}))
                      AND ${day_date} <date_trunc('quarter',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD(quarter,-2,date_trunc('quarter',${today}))
                      AND ${day_date} < DATEADD(quarter,-1*1, date_trunc('quarter',${today}))
                      THEN DATEADD(day,datediff(day,DATEADD(quarter,-2, date_trunc('quarter',${today})), DATEADD(quarter,-1, date_trunc('quarter',${today}))), ${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},DATEADD(quarter,-1,date_trunc('quarter',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "This_year" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= date_trunc('year',${today})
                      AND ${day_date} < ${today}
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('year',-1 ,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD('year',-1 ,${today})
                      THEN DATEADD(day,datediff(day,DATEADD('year',-1 ,date_trunc('year',${today})), date_trunc('year',${today})) ,${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},date_trunc('year',${today}))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "Last_year" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >= DATEADD('year',-1,date_trunc('year',${today}))
                      AND ${day_date} <date_trunc('year',${today})
                      THEN ${day_date}
              WHEN ${day_date} >=  DATEADD('year',-2,date_trunc('year',${today}))
                      AND ${day_date} < DATEADD(quarter,-1*1, date_trunc('year',${today}))
                      THEN DATEADD(day,datediff(day,DATEADD('year',-2, date_trunc('year',${today})), DATEADD('year',-1, date_trunc('year',${today}))), ${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},DATEADD('year',-1,date_trunc('year',${today})))),${day_date})
              END
      {% endif %}
    {% elsif  period_selection._parameter_value  ==  "Custom_period" %}
      {% if period_comparison_type._parameter_value  ==  "'Previous period'"  %}
          CASE
              WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN ${day_date}
              WHEN ${day_date} >= DATEADD(day,-1*(1+datediff(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) , {% date_start custom_date_filter %})
                      AND ${day_date} < {% date_start custom_date_filter %}
                      THEN DATEADD(day,(1+datediff(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) ,${day_date})
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
                      THEN DATEADD(day,1*(datediff(day,{% date_start custom_previous_date_filter %},{% date_start custom_date_filter %})),${day_date})
              END
      {% endif %}
    {% endif %}
    ;;
  }

  # same as above but for the previous_period this _looks_ complex, but is actually just a bunch of interleaved if/else statements to evaluate the
  # correct granularity and comparison types
  dimension: previous_period {
    label: "Period status"
    type: string
    description: "Makes the difference between main period and comparison period"
    sql:
    {% if  period_selection._parameter_value  ==  "Today"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Yesterday"  %}
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
    {% elsif  period_selection._parameter_value  ==  "This_week"  %}
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

    {% elsif  period_selection._parameter_value  ==  "Last_week"  %}
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

    {% elsif  period_selection._parameter_value  ==  "Last_7_days"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Last_14_days"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Last_30_days"  %}
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
    {% elsif  period_selection._parameter_value  ==  "This_month"  %}
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

    {% elsif  period_selection._parameter_value  ==  "Last_month"  %}
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
    {% elsif  period_selection._parameter_value  ==  "This_quarter"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Last_quarter"  %}
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
    {% elsif  period_selection._parameter_value  ==  "This_year"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Last_year"  %}
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
    {% elsif  period_selection._parameter_value  ==  "Custom_period"  %}
      {% if  period_comparison_type._parameter_value  ==  "'Previous period'"  %}
         CASE
              WHEN ${day_date} >=  {% date_start custom_date_filter %}
                AND ${day_date} <= {% date_end custom_date_filter %}
                THEN 'Current Period'
              WHEN ${day_date} >= DATEADD(day,-1*(1+datediff(day,{% date_start custom_date_filter %},{% date_end custom_date_filter %})) , {% date_start custom_date_filter %})
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
      {% elsif  period_comparison_type._parameter_value  ==  "Custom period"  %}
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

  # ignore this unless you're wanting to create some sort of variables for HTML/Liquid
  dimension: previous_day_label {
    type: number
    hidden: yes
    sql:
    {% if  period_selection._parameter_value  ==  "Today" %}
      datediff(second,{% date_start custom_previous_date_filter %}, ${today})
    {% elsif  period_selection._parameter_value  ==  "Yesterday" %}
      datediff(second,dateadd(second,-{{period_selection._parameter_value}},CURRENT_DATE),${today}-1)
    {% elsif  period_selection._parameter_value  ==  "This_week" %}
     datediff(second,{% date_start custom_previous_date_filter %},date_trunc('week',${today}))
    {% elsif  period_selection._parameter_value  ==  "Last_week" %}
     datediff(second,{% date_start custom_previous_date_filter %},date_trunc('week',${today}))
    {% elsif  period_selection._parameter_value  ==  "Last_7_days" %}
      datediff(second,{% date_start custom_previous_date_filter %},${today}-7)
    {% elsif  period_selection._parameter_value  ==  "Last_14_days" %}
     datediff(second,{% date_start custom_previous_date_filter %},${today}-14)
    {% elsif  period_selection._parameter_value  ==  "Last_30_days" %}
      datediff(second,{% date_start custom_previous_date_filter %},${today}-30)
    {% elsif  period_selection._parameter_value  ==  "This_month" %}
     datediff(second,{% date_start custom_previous_date_filter %},date_trunc('month',${today}))
    {% elsif  period_selection._parameter_value  ==  "Last_month" %}
     datediff(second,{% date_start custom_previous_date_filter %},DATEADD(month,-1*(1), date_trunc('month',${today})))
    {% elsif  period_selection._parameter_value  ==  "This_quarter" %}
     datediff(second,{% date_start custom_previous_date_filter %},,date_trunc('quarter',${today}))
    {% elsif  period_selection._parameter_value  ==  "Last_quarter" %}
     datediff(second,{% date_start custom_previous_date_filter %},DATEADD(quarter,-1,date_trunc('quarter',${today})))
    {% elsif  period_selection._parameter_value  ==  "This_year" %}
     datediff(second,{% date_start custom_previous_date_filter %},date_trunc('year',${today}))
    {% elsif  period_selection._parameter_value  ==  "Last_year" %}
     datediff(second,{% date_start custom_previous_date_filter %},DATEADD('year',-1,date_trunc('year',${today})))
    {% elsif  period_selection._parameter_value  ==  "Custom_period" %}
      {% if  period_comparison_type._parameter_value  ==  "'Custom_period'" %}
        datediff(second,{% date_start custom_previous_date_filter %},{% date_start custom_date_filter %})
      {% else %}
        datediff(second,{% date_start custom_date_filter %},{% date_end custom_date_filter %})+24*60*60
      {% endif %}
    {% endif %}
    ;;
  }
  dimension: previous_day_counter {
    type: number
    hidden: yes
    sql:
    {% if  period_selection._parameter_value  ==  "Today" %}
      86400
    {% elsif  period_selection._parameter_value  ==  "Yesterday" %}
      86400
    {% elsif  period_selection._parameter_value  ==  "This_week" %}
     604800
    {% elsif  period_selection._parameter_value  ==  "Last_week" %}
     604800
    {% elsif  period_selection._parameter_value  ==  "Last_7_days" %}
     604800
    {% elsif  period_selection._parameter_value  ==  "Last_14_days" %}
     1209600
    {% elsif  period_selection._parameter_value  ==  "Last_30_days" %}
     2592000
    {% elsif  period_selection._parameter_value  ==  "This_month" %}
     2592000
    {% elsif  period_selection._parameter_value  ==  "Last_month" %}
     2592000
    {% elsif  period_selection._parameter_value  ==  "This_quarter" %}
     7776000
    {% elsif  period_selection._parameter_value  ==  "Last_quarter" %}
     7776000
    {% elsif  period_selection._parameter_value  ==  "This_year" %}
     31536000
    {% elsif  period_selection._parameter_value  ==  "Last_year" %}
     31536000
    {% elsif  period_selection._parameter_value  ==  "Custom_period" %}
      {% if  period_comparison_type._parameter_value  ==  "'Custom_period'" %}
        datediff(second,{% date_start custom_previous_date_filter %},{% date_start custom_date_filter %})
      {% else %}
        datediff(second,{% date_start custom_date_filter %},{% date_end custom_date_filter %})+24*60*60
      {% endif %}
    {% endif %}
    ;;
  }
  measure: count {type:count}
  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.sale_price ;;}
}


explore: order_dates{}
view: order_dates {
  derived_table: {
    sql: SELECT created_at as date FROM order_items
              WHERE
              {% if date_parameter._parameter_value == 'Today' %}
                created_at=(GETDATE())::DATE
              {% elsif date_parameter._parameter_value == 'Yesterday' %}
                created_at=(getdate() - INTERVAL '1 days')::DATE
              {% elsif date_parameter._parameter_value == 'This_Week' %}
                (((created_at ) >= ((DATE_TRUNC('week', DATE_TRUNC('day',GETDATE())))) AND (created_at) < ((DATEADD(week,1, DATE_TRUNC('week', DATE_TRUNC('day', GETDATE())) )))))
              {% elsif date_parameter._parameter_value == 'Last_Week' %}
                (((created_at ) >= ((DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day', GETDATE())) ))) AND (created_at ) < ((DATEADD(week,1, DATEADD(week,-1, DATE_TRUNC('week', DATE_TRUNC('day',GETDATE())) ) )))))
              {% elsif date_parameter._parameter_value == 'This_Month' %}
                (((created_at ) >= ((DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())))) AND (created_at) < ((DATEADD(month,1, DATE_TRUNC('month', DATE_TRUNC('day', GETDATE())) )))))
              {% elsif date_parameter._parameter_value == 'Last_Month' %}
                (((created_at ) >= ((DATEADD(month,-1, DATE_TRUNC('month', DATE_TRUNC('day', GETDATE())) ))) AND (created_at ) < ((DATEADD(month,1, DATEADD(month,-1, DATE_TRUNC('month', DATE_TRUNC('day',GETDATE())) ) )))))
              {% else %}
                created_at >= (GETDATE() - INTERVAL '365 days')::DATE
              {% endif %}

               ;;
              persist_for: "6 hours"
              distribution_style: all
              }
  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
    convert_tz: no
  }
  parameter: date_parameter {
    type: unquoted
    default_value: "Today"
    allowed_value: {label: "Today" value: "Today"}
    allowed_value: {label: "Yesterday" value: "Yesterday"}
    allowed_value: {label: "This Week" value: "This_Week"}
    allowed_value: {label: "Last Week" value: "Last_Week"}
    allowed_value: {label: "This Month" value: "This_Month"}
    allowed_value: {label: "Last Month" value: "Last_Month"}
    }
  }

 view: order_items {
    sql_table_name: public.order_items ;;
    # sql_table_name:
    # {% if dimension_selector._parameter_value == 'A' and subdimension_selector._parameter_value == 'A' %} AA {{dimension_selector._parameter_value}}{{subdimension_selector._parameter_value}}
    # {% elsif dimension_selector._parameter_value == 'A' and subdimension_selector._parameter_value == 'B' %} AB {{dimension_selector._parameter_value}}{{subdimension_selector._parameter_value}}
    # {% elsif dimension_selector._parameter_value == 'B' and subdimension_selector._parameter_value == 'A' %} BA {{dimension_selector._parameter_value}}{{subdimension_selector._parameter_value}}
    # {% else %} BB
    # {% endif %}

    # ;;
    # ########## Table Selector Parameters ###########

    # parameter:  dimension_selector{
    #   type: unquoted
    #   allowed_value: {value:"A"}
    #   allowed_value: {value:"B"}
    # }
    # parameter:  subdimension_selector{
    #   type: unquoted
    #   allowed_value: {value:"A"}
    #   allowed_value: {value:"B"}
    # }

    ########## IDs, Foreign Keys, Counts ###########



    filter: product_brand_filter {
      hidden: yes
      type: string
    }

    # dimension: custom_array {
    #   sql: {% if users.country._is_selected %} ${users.country} {% else %} '' {% endif %}
    #   {% if products.category._is_selected %}|| ' ' || ${products.category}  ||''{% else %} '' {% endif %}
    #   {% if users.traffic_source._is_selected %}|| ' ' || ${users.traffic_source}  ||''{% else %} '' {% endif %}
    #   ;;
    # }

    dimension: brand {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{products.header_name._parameter_value }} {% endif %}"
      sql:
          CASE WHEN {% condition product_brand_filter %} TRIM(${products.brand}) {% endcondition %}
          THEN
          '(1) - ' || TRIM(${products.brand})
          WHEN {{_user_attributes['is_internal']}} = 1 THEN 'Competitor - ' || TRIM(${products.brand})
          ELSE 'Competitor ' || TRIM(${competitor_query.rank})
          END ;;

        link: {
          label: "Website"
          url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
          icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
        }

        link: {
          label: "Facebook"
          url: "http://www.google.com/search?q=site:facebook.com+{{ value | encode_uri }}+clothes&btnI"
          icon_url: "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg"
        }

        link: {
          label: "{{value}} Analytics Dashboard"
          url: "/dashboards/8?Brand%20Name={{ value | encode_uri }}"
          icon_url: "http://www.looker.com/favicon.ico"
        }
        # html: <a href = "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"><u>{{rendered_value}}</u></a> ;;

      }
    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }

    dimension: inventory_item_id {
      type: number
      hidden: yes
      sql: ${TABLE}.inventory_item_id ;;
    }

    dimension: user_id {
      type: number
      hidden: no
      sql: ${TABLE}.user_id ;;
    }

    dimension: user_id_evens{
      sql:
      '{{user_id._value | modulo:2}}';;
    }

    measure: count {
      type: count_distinct
      sql: ${id} ;;
      drill_fields: [detail*]
    }

    measure: order_count {
      view_label: "Orders"
      type: count_distinct
      drill_fields: [detail*]
      sql: ${order_id} ;;
    }


    measure: count_last_28d {
      label: "Count Sold in Trailing 28 Days"
      type: count_distinct
      sql: ${id} ;;
      hidden: yes
      filters:
      {field:created_date
        value: "28 days"
      }}

    dimension: order_id {
      type: number
      sql: ${TABLE}.order_id ;;


      action: {
        label: "Send this to slack channel"
        url: "https://hooks.zapier.com/hooks/catch/1662138/tvc3zj/"

        param: {
          name: "user_dash_link"
          value: "https://demo.looker.com/dashboards/160?Email={{ users.email._value}}"
        }

        form_param: {
          name: "Message"
          type: textarea
          default: "Hey,
          Could you check out order #{{value}}. It's saying its {{status._value}},
          but the customer is reaching out to us about it.
          ~{{ _user_attributes.first_name}}"
        }

        form_param: {
          name: "Recipient"
          type: select
          default: "zevl"
          option: {
            name: "zevl"
            label: "Zev"
          }
          option: {
            name: "slackdemo"
            label: "Slack Demo User"
          }

        }

        form_param: {
          name: "Channel"
          type: select
          default: "cs"
          option: {
            name: "cs"
            label: "Customer Support"
          }
          option: {
            name: "general"
            label: "General"
          }

        }


      }



    }

    ########## Time Dimensions ##########

    dimension_group: returned {
      type: time
      timeframes: [time, date, week, month, raw]
      sql: ${TABLE}.returned_at ;;
    }

    dimension_group: shipped {
      type: time
      timeframes: [date, week, month, raw]
      sql: ${TABLE}.shipped_at ;;
    }

    dimension_group: delivered {
      type: time
      timeframes: [date, week, month, raw]
      sql: ${TABLE}.delivered_at ;;
    }

    dimension_group: created {
      type: time
      timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, day_of_month, month_num, month_name, raw, week_of_year]
      sql:
      ${TABLE}.created_at ;;
    }

    ### Custom date range selection

    parameter: date_range {
      description: "If you want to filter all results to the 25th to Month End, select that option, otherwise this will result in all dates showing."
      type: unquoted
      default_value: "1"
      allowed_value: {
        label: "25th to Month End"
        value: "25"
      }
      allowed_value: {
        label: "14th to 25th"
        value: "14"
      }
      allowed_value: {
        label: "All Dates"
        value: "1"
      }
    }


    ###

    dimension: reporting_period {
      group_label: "Order Date"
      sql: CASE
        WHEN date_part('year',${created_raw}) = date_part('year',current_date)
        AND ${created_raw} < CURRENT_DATE
        THEN 'This Year to Date'

        WHEN date_part('year',${created_raw}) + 1 = date_part('year',current_date)
        AND date_part('dayofyear',${created_raw}) <= date_part('dayofyear',current_date)
        THEN 'Last Year to Date'

      END
       ;;
    }

    dimension: days_since_sold {
      hidden: yes
      sql: datediff('day',${created_raw},CURRENT_DATE) ;;
    }

    dimension: months_since_signup {
      view_label: "Orders"
      type: number
      sql: DATEDIFF('month',${users.created_raw},${created_raw}) ;;
    }

########## Logistics ##########

    dimension: status {
      sql: ${TABLE}.status ;;
    }

    dimension: days_to_process {
      type: number
      sql: CASE
        WHEN ${status} = 'Processing' THEN DATEDIFF('day',${created_raw},GETDATE())*1.0
        WHEN ${status} IN ('Shipped', 'Complete', 'Returned') THEN DATEDIFF('day',${created_raw},${shipped_raw})*1.0
        WHEN ${status} = 'Cancelled' THEN NULL
      END
       ;;
    }

    dimension: shipping_time {
      type: number
      sql: datediff('day',${shipped_raw},${delivered_raw})*1.0 ;;
    }

    measure: average_days_to_process {
      type: average
      value_format_name: decimal_2
      sql: ${days_to_process} ;;
    }

    measure: average_shipping_time {
      type: average
      value_format_name: decimal_2
      sql: ${shipping_time} ;;
    }

########## Financial Information ##########

    dimension: sale_price {
      type: number
      value_format_name: usd
      sql: ${TABLE}.sale_price ;;
    }

    dimension: gross_margin {
      type: number
      value_format_name: usd
      sql: ${sale_price} - ${inventory_items.cost} ;;
    }

    dimension: item_gross_margin_percentage {
      type: number
      value_format_name: percent_2
      sql: 1.0 * ${gross_margin}/NULLIF(${sale_price},0) ;;
    }

    dimension: item_gross_margin_percentage_tier {
      type: tier
      sql: 100*${item_gross_margin_percentage} ;;
      tiers: [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
      style: interval
    }

    #-- Parameters

      parameter: metric_selector {
        default_value: "Rev"
        type: unquoted
        allowed_value: {value:"Rev"}
        allowed_value: {value:"CPO"}
        allowed_value: {value:"CPC"}
        allowed_value: {value:"CPM"}
        allowed_value: {value:"Cost"}
        allowed_value: {value:"Clicks"}
      }
      parameter: metric_selector_1 {
        default_value: "Rev"
        type: unquoted
        allowed_value: {value:"Rev"}
        allowed_value: {value:"CPO"}
        allowed_value: {value:"CPC"}
        allowed_value: {value:"CPM"}
        allowed_value: {value:"Cost"}
        allowed_value: {value:"Clicks"}
      }
      parameter: metric_selector_2 {
        default_value: "Rev"
        type: unquoted
        allowed_value: {value:"Rev"}
        allowed_value: {value:"CPO"}
        allowed_value: {value:"CPC"}
        allowed_value: {value:"CPM"}
        allowed_value: {value:"Cost"}
        allowed_value: {value:"Clicks"}
      }
    measure: dynamic_metric {
      label_from_parameter: metric_selector
      type: number
      drill_fields: [dynamic_metric,dynamic_metric_1,dynamic_metric_2]
      sql: {% if metric_selector._parameter_value =='Rev' %} ${total_sale_price}
      {% elsif metric_selector._parameter_value =='Cost' %} ${total_gross_margin}
      {% elsif metric_selector._parameter_value =='CPM' %} ${total_gross_margin_percentage}
      {% else %} ${average_spend_per_user}
      {% endif %}
      ;;
    }
      measure: dynamic_metric_1 {
        label_from_parameter: metric_selector_1
        type: number
        drill_fields: [dynamic_metric,dynamic_metric_1,dynamic_metric_2]
        sql: {% if metric_selector_1._parameter_value =='Rev' %} ${total_sale_price}
                {% elsif metric_selector_1._parameter_value =='Cost' %} ${total_gross_margin}
                {% elsif metric_selector_1._parameter_value =='CPM' %} ${total_gross_margin_percentage}
                {% else %} ${average_spend_per_user}
                {% endif %}
                ;;
      }
      measure: dynamic_metric_2 {
        label_from_parameter: metric_selector_2
        type: number
        drill_fields: [dynamic_metric,dynamic_metric_1,dynamic_metric_2]
        sql: {% if metric_selector_2._parameter_value =='Rev' %} ${total_sale_price}
                {% elsif metric_selector_2._parameter_value =='Cost' %} ${total_gross_margin}
                {% elsif metric_selector_2._parameter_value =='CPM' %} ${total_gross_margin_percentage}
                {% else %} ${average_spend_per_user}
                {% endif %}
                ;;
      }

    parameter: sales_cost {
      type: unquoted
      allowed_value: {value:"Sales"}
      allowed_value: {value:"Cost"}
      }
    measure: total_sale_price {
      type: sum
      value_format_name: usd
      sql: ${sale_price} ;;
      # drill_fields: [detail*]

      html:
      {% if sales_cost._parameter_value == 'Sales' %}
        {% if value > 10000 %}
        <a style="color:green" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
        {% else %}
        <a style="color:red" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
        {% endif %}
      {% elsif sales_cost._parameter_value == 'Cost' %}
        {% if value > 10000 %}
        <a style="color:red" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
        {% else %}
        <a style="color:green" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
        {% endif %}
      {% endif %}

        ;;
    }

    measure: total_gross_margin {
      type: sum
      value_format_name: usd
      sql: ${gross_margin} ;;
      drill_fields: [detail*]
    }

    measure: average_sale_price {
      type: average
      value_format_name: usd
      sql: ${sale_price} ;;
      drill_fields: [detail*]
    }

    measure: median_sale_price {
      type: median
      value_format_name: usd
      sql: ${sale_price} ;;
      drill_fields: [detail*]
    }

    measure: average_gross_margin {
      type: average
      value_format_name: usd
      sql: ${gross_margin} ;;
      drill_fields: [detail*]
    }

    measure: total_gross_margin_percentage {
      type: number
      value_format_name: percent_2
      sql: 1.0 * ${total_gross_margin}/ NULLIF(${total_sale_price},0) ;;
    }

    measure: average_spend_per_user {
      type: number
      value_format_name: usd
      sql: 1.0 * ${total_sale_price} / NULLIF(${users.count},0) ;;
      drill_fields: [detail*]
    }

########## Return Information ##########

    dimension: is_returned {
      type: yesno
      sql: ${returned_raw} IS NOT NULL ;;
    }

    measure: returned_count {
      type: count_distinct
      sql: ${id} ;;
      filters: {
        field: is_returned
        value: "yes"
      }
      drill_fields: [detail*]
    }

    measure: returned_total_sale_price {
      type: sum
      value_format_name: usd
      sql: ${sale_price} ;;
      filters: {
        field: is_returned
        value: "yes"
      }
    }

    measure: return_rate {
      type: number
      value_format_name: percent_2
      sql: 1.0 * ${returned_count} / nullif(${count},0) ;;
    }


########## Repeat Purchase Facts ##########

    dimension: days_until_next_order {
      type: number
      view_label: "Repeat Purchase Facts"
      sql: DATEDIFF('day',${created_raw},${repeat_purchase_facts.next_order_raw}) ;;
    }

    dimension: repeat_orders_within_30d {
      type: yesno
      view_label: "Repeat Purchase Facts"
      sql: ${days_until_next_order} <= 30 ;;
    }

    measure: count_with_repeat_purchase_within_30d {
      type: count_distinct
      sql: ${id} ;;
      view_label: "Repeat Purchase Facts"

      filters: {
        field: repeat_orders_within_30d
        value: "Yes"
      }
    }

    measure: 30_day_repeat_purchase_rate {
      description: "The percentage of customers who purchase again within 30 days"
      view_label: "Repeat Purchase Facts"
      type: number
      value_format_name: percent_1
      sql: 1.0 * ${count_with_repeat_purchase_within_30d} / NULLIF(${count},0) ;;
      drill_fields: [products.brand, order_count, count_with_repeat_purchase_within_30d, 30_day_repeat_purchase_rate]
    }

    measure: first_purchase_count {
      view_label: "Orders"
      type: count_distinct
      sql: ${order_id} ;;

      filters: {
        field: order_facts.is_first_purchase
        value: "Yes"
      }
      # customized drill path for first_purchase_count
      drill_fields: [user_id, order_id, created_date, users.traffic_source]
      link: {
        label: "New User's Behavior by Traffic Source"
        url: "
        {% assign vis_config = '{
        \"type\": \"looker_column\",
        \"show_value_labels\": true,
        \"y_axis_gridlines\": true,
        \"show_view_names\": false,
        \"y_axis_combined\": false,
        \"show_y_axis_labels\": true,
        \"show_y_axis_ticks\": true,
        \"show_x_axis_label\": false,
        \"value_labels\": \"legend\",
        \"label_type\": \"labPer\",
        \"font_size\": \"13\",
        \"colors\": [
        \"#1ea8df\",
        \"#a2dcf3\",
        \"#929292\"
        ],
        \"hide_legend\": false,
        \"y_axis_orientation\": [
        \"left\",
        \"right\"
        ],
        \"y_axis_labels\": [
        \"Average Sale Price ($)\"
        ]
        }' %}
        {{ hidden_first_purchase_visualization_link._link }}&vis_config={{ vis_config | encode_uri }}&sorts=users.average_lifetime_orders+descc&toggle=dat,pik,vis&limit=5000"
      }
    }

########## Dynamic Sales Cohort App ##########

    filter: cohort_by {
      type: string
      hidden: yes
      suggestions: ["Week", "Month", "Quarter", "Year"]
    }

    parameter: metric {
      type: string
      hidden: no
      suggestions: ["Order Count", "Gross Margin", "Total Sales", "Unique Users"]
    }

    dimension_group: first_order_period {
      type: time
      timeframes: [date]
      hidden: yes
      sql: CAST(DATE_TRUNC({% parameter cohort_by %}, ${user_order_facts.first_order_date}) AS DATE)
        ;;
    }

    dimension: periods_as_customer {
      type: number
      hidden: yes
      sql: DATEDIFF({% parameter cohort_by %}, ${user_order_facts.first_order_date}, ${user_order_facts.latest_order_date})
        ;;
    }

    measure: cohort_values_0 {
      label: "Cohort Values"
      type: count_distinct
      hidden: no
      sql: CASE WHEN {{  metric._parameter_value =="Order Count" }}  THEN ${id}
        WHEN {% parameter metric %} = 'Unique Users' THEN ${users.id}
        ELSE null
      END
       ;;
    }

    measure: cohort_values_1 {
      type: sum
      hidden: yes
      sql: CASE WHEN {% parameter metric %} = 'Gross Margin' THEN ${gross_margin}
        WHEN {% parameter metric %} = 'Total Sales' THEN ${sale_price}
        ELSE 0
      END
       ;;
    }

    measure: values {
      type: number
      hidden: yes
      sql: ${cohort_values_0} + ${cohort_values_1} ;;
    }

    measure: hidden_first_purchase_visualization_link {
      hidden: yes
      view_label: "Orders"
      type: count_distinct
      sql: ${order_id} ;;

      filters: {
        field: order_facts.is_first_purchase
        value: "Yes"
      }
      drill_fields: [users.traffic_source, user_order_facts.average_lifetime_revenue, user_order_facts.average_lifetime_orders]
    }




########## Sets ##########

    set: detail {
      fields: [id, order_id, status, created_date, sale_price, products.brand, products.item_name, users.portrait, users.name, users.email]
    }
    set: return_detail {
      fields: [id, order_id, status, created_date, returned_date, sale_price, products.brand, products.item_name, users.portrait, users.name, users.email]
    }
  }
