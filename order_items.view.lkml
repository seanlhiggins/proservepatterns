# view: order_items_de {
#   extends: [order_items_base]
#   sql_table_name: public.order_items ;;

#   measure: total_sale_price {
#     sql: ${sale_price} * 0.88 ;;
#   }

# }

# view: order_items_last_week {
#   derived_table: {
#     sql: SELECT * FROM public.ORDER_ITEMS  ((( CAST(order_items.CREATED_AT as DATE) ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(day,-6, DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE())) )))) AND ( CAST(order_items.CREATED_AT as DATE) ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(day,7, DATEADD(day,-6, DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE())) ) )))))) ;;
#   persist_for: "1 hour"
#   }
# }
# view: order_items_last_month {
#   derived_table: {
#     sql: SELECT * FROM public.ORDER_ITEMS  ((( CAST(order_items.CREATED_AT as DATE) ) >= ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(day,-30, DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE())) )))) AND ( CAST(order_items.CREATED_AT as DATE) ) < ((CONVERT_TIMEZONE('America/Los_Angeles', 'UTC', DATEADD(day,7, DATEADD(day,-30, DATE_TRUNC('day',CONVERT_TIMEZONE('UTC', 'America/Los_Angeles', GETDATE())) ) )))))) ;;
#     persist_for: "1 hour"
#   }
# }

# datagroup: etl_update {
#   sql_trigger: SELECT count(*) FROM order_items ;;
#   max_cache_age: "1 minute"
# }

# view: user_order_facts {
#   derived_table: {
#     # sql_trigger_value: SELECT CURRENT_DATE ;;
#     # persist_for: "12 hours"
#     datagroup_trigger: etl_update
#     sql: SELECT user_id, count(*) FROM order_items ;;
#   }

# }

view: order_items {
  # extension: required
  sql_table_name: public.ORDER_ITEMS ;;
# sql_table_name:
# {% if date_diff_selected._value < 7 %}
# ${order_items_last_week.SQL_TABLE_NAME}
# {% elsif date_diff_selected._value < 31 %}
# ${order_items_last_month.SQL_TABLE_NAME}
# {% else %}
# public.ORDER_ITEMS
# {% endif %}
# ;;
  dimension: date_diff_selected {
    type: number
    sql: DATEDIFF(day,{% date_start previous_period_filter %},CURRENT_DATE) ;;
  }

  parameter: previous_period_comparison_granularity {
    description: "Select the comparison period. E.g. choosing Month will compare the selected range against the same dates 30 days ago. "
    type: unquoted

    allowed_value: {
      label: "Week"
      value: "7"
    }
    allowed_value: {
      label: "Month"
      value: "30"
    }
    allowed_value: {
      label: "Year"
      value: "365"
    }
  }

  filter: previous_period_filter {
    label: "Previous Period/This Period filter Range"
    description: "Previous Period Filter for specific measures. User Date filter for any regular measures."
    type: date
    sql:
    {% if period_over_period._in_query %}
    (${created_date} >=  {% date_start previous_period_filter %}
    AND ${created_date} <= {% date_end previous_period_filter %})

     OR
     (${created_date} >= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}, {% date_start previous_period_filter %} )
     AND ${created_date} <= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}+DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %}),{% date_start previous_period_filter %} ))
    {% else %}
    {% condition previous_period_filter %} CAST(${created_raw} as DATE) {% endcondition %}
    {% endif %}
    ;;
    }

    # For Amazon Redshift
    # ${created_raw} is the timestamp dimension we are building our reporting period off of
    dimension: period_over_period {
      type: string
      description: "The reporting period as selected by the Previous Period Filter"
      sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_date} >=  {% date_start previous_period_filter %}
                AND ${created_date} <= {% date_end previous_period_filter %}
                THEN 'This Period'

                WHEN ${created_date} >= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}, {% date_start previous_period_filter %} )
                AND ${created_date} <= DATEADD(day,-{{ previous_period_comparison_granularity._parameter_value }}+DATEDIFF(day,{% date_start previous_period_filter %}, {% date_end previous_period_filter %}),{% date_start previous_period_filter %} )

                THEN 'Previous Period'
            END
            ELSE
            'This Period'
          END ;;
    }


  parameter: period_filter {
    type: date
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

filter: consolidated_filter {
  type: string
  sql: {% condition consolidated_filter %}LIKE '%' {% endcondition %};;
}
  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      month_name,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.CREATED_AT ;;
    }
  # parameter: week_selector {
  #   type: unquoted
  #   default_value: "Current Week"
  #   allowed_value: {
  #     value: "0"
  #     label: "Current Week"
  #   }
  #   allowed_value: {
  #     value: "7"
  #     label: "Last Week"
  #   }
  # }
  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.DELIVERED_AT ;;
  }

  dimension: inventory_item_id {
    type: number
    sql: ${TABLE}.INVENTORY_ITEM_ID ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.ORDER_ID ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.RETURNED_AT ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.SALE_PRICE ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.SHIPPED_AT ;;
  }

  dimension: gross_margin {
    label: "{% if _user_attributes['customer'] == 'A' %} Standard Margin
    {% elsif _user_attributes['customer'] == 'B' %} Operating Margin
    {% else %} Gross Margin {% endif %}"
    type: number
    value_format_name: usd
    sql: ${sale_price} - ${inventory_items.cost} ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.STATUS ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.USER_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
#     html:
#     {{ vis }};;
    # {% if value > 10 and created_date._in_query %}
    # <p style="color: Red; background-color: grey; font-size:100%; text-align:center">{{ rendered_value }}</p>
    # {% else %}
    # {{rendered_value}}
    # {% endif %}
    # ;;
  }


  dimension: timeframes_parameter {
    description: "Use this field in combination with the date filter field for dynamic date filtering"
    suggestions: ["period","previous period"]
    type: string
    case:  {
      when:  {
        sql: TO_CHAR(DATE_TRUNC('month',${created_date}),'YYYY-MM') = {% parameter month_name %};;
        label: "Current Month"
      }
      when: {
        sql: TO_CHAR(DATE_TRUNC('month',DATEADD(month, 1,${created_date})),'YYYY-MM')  = {% parameter month_name %};;
        label: "Previous Month"
      }
      else: "All Other Months"
    }
  }


  parameter: metric_selector {hidden: yes
    type: string
    allowed_value: {
      label: "Total Order Revenue"
      value: "total_revenue"
    }

    allowed_value: {
      label: "Median Sale Price"
      value: "median_sale_price"
    }
  }
  measure: metric {
    label_from_parameter: metric_selector
    type: number
    sql:
      CASE
        WHEN {% parameter metric_selector %} = 'total_revenue' THEN
          ${total_revenue_filtered}

          WHEN {% parameter metric_selector %} = 'median_sale_price' THEN
          ${median_sale_price}
        ELSE
          ${count}
      END ;;

  }


  parameter: month_name {hidden: no
    type: string
    allowed_value: {label: "January" value: "2018-01"}
    allowed_value: {label: "February" value: "2018-02"}
    allowed_value: {label: "March" value: "2018-03"}
    allowed_value: {label: "April" value: "2018-04"}
    allowed_value: {label: "May" value: "2018-05"}
    allowed_value: {label: "June" value: "2018-06"}
    allowed_value: {label: "July" value: "2018-07"}
    allowed_value: {label: "August" value: "2018-08"}
    allowed_value: {label: "September" value: "2018-09"}
    allowed_value: {label: "October" value: "2018-10"}
    allowed_value: {label: "November" value: "2018-11"}
    allowed_value: {label: "December" value: "2017-12"}
  }

  dimension: is_selected_month_or_previous_month {
    type: yesno
    sql: TO_CHAR(DATE_TRUNC('month',${created_date}),'YYYY-MM') = {% parameter month_name %}
      OR TO_CHAR(DATE_TRUNC('month',DATEADD(month, 1,${created_date})),'YYYY-MM')  = {% parameter month_name %};;
  }
  measure: total_revenue_filtered {
    type: sum
    sql: ${sale_price};;
    filters: {
      field: is_selected_month_or_previous_month
      value: "yes"
    }
  }

  measure: median_sale_price {
    type: median
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
    filters: {
      field: is_selected_month_or_previous_month
      value: "yes"
    }
  }

  measure: total_gross_margin {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
    filters: {
      field: is_selected_month_or_previous_month
      value: "yes"
    }
  }
  measure: total_sales_price {
    sql: ${sale_price} ;;
    type: sum
    drill_fields: [created_date,created_raw,total_sales_price]
    html:
    {% if users.count._value > 9900 %}
    <div style="color:green">{{rendered_value}}</div>
    {% elsif users.count._value < 9500 %}
    <div style="color:pink">{{rendered_value}}</div>
    {% else %}
    {{rendered_value}}
    {% endif %}
    ;;
  }
  measure: ttl_gross_margin {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;

    html: <div style="width:100%; text-align: centre;"> <details>
      <summary style="outline:none">{{ total_gross_margin._linked_value }}</summary>
      Sale Price: {{ total_sales_price._linked_value }}
      <br/>
      Inventory Costs: {{ inventory_items.total_cost._linked_value }}

      </details>
      </div>;;
  }

  measure: total_position {
    type: sum
    label: "Overall Position"
    description: "Sum of position at a given time for a given position label."
    drill_fields:[detail*]
    sql: ${sale_price} ;;
    value_format_name: decimal_2
     html:
   <div style="width:100%"><details>
        <summary style="outline:none">{{ linked_value }}</summary>
    {% if created_year._value == 2018 %}
          Gross Margin - {{ ttl_gross_margin._rendered_value }} <br>
          Total Revenue - {{ total_sales_price._rendered_value}}
        </details>
        </div>
    {% elsif created_year._value == 2017 %}
        Other thing - 1 <br>
        Another thing - 2
        </details>
        </div>
    {% else %}
          Cost - {{ inventory_items.count._linked_value }} <br>
          User Count - {{ users.count._linked_value }}
          <br/>
        </details>
        </div>
    {% endif %}
;;

  }
  filter: period_length {
    type: date
    default_value: "90 days"
  }

  dimension: num_days {
    # hidden: yes
    type: string
    sql: datediff({% date_end period_length %},{% date_start period_length %}) ;;
  }

  dimension: period_comparison {
    # hidden: yes
    allow_fill: no
    type: string
    case: {
      when: {sql: datediff(days,current_date,${created_date}) < ${num_days};; label: "Current period"}
      when: {sql: datediff(days,current_date,${created_date}) < (${num_days} + ${num_days}) ;; label: "Prior period"}
      else: "Out of date period range"
    }
  }
  measure: gross_margin_for_selected_period {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
    filters: {
      field: period_comparison
      value: "Current period"
    }
  }
  measure: gross_margin_for_preceding_period {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
    filters: {
      field: period_comparison
      value: "Prior period"
    }
  }
#   parameter: view_label {
#     type: unquoted
#     hidden: yes
#     default_value: "TEST"
#   }
#
#   dimension: parameter_pass_through {
#     sql: {% parameter view_label %} ;;
#   }
#
#   dimension: test {
#     view_label: "{% parameter view_label %}"
#     sql: 1 ;;
#   }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      inventory_items.product_name,
      inventory_items.id,
      users.last_name,
      users.first_name,
      users.id
    ]
  }
}
