view: order_items {
  extends: [order_items_base]
  ########## IDs, Foreign Keys, Counts ###########

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
    hidden: yes
    sql: ${TABLE}.user_id ;;
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
    timeframes: [time, hour, date, week, month, year, hour_of_day, day_of_week, month_num, month_name, raw, week_of_year]
    sql: ${TABLE}.created_at ;;
  }

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

  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
    drill_fields: [detail*]
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

  parameter: cohort_by {
    type: string
    hidden: yes
    allowed_value: {
      value: "Week"
    }
    allowed_value: {
      value: "Month"
    }
    allowed_value: {
      value: "Quarter"
    }
    allowed_value: {
      value: "Year"
    }
  }

  parameter: metric {
    type: string
    hidden: yes
    suggestions: ["Order Count", "Gross Margin", "Total Sales", "Unique Users"]
  }

  dimension_group: first_order_period {
    type: time
    timeframes: [date]
    hidden: yes
    sql: CAST(DATE_TRUNC({{ cohort_by._parameter_value }}, ${user_order_facts.first_order_date}) AS DATE)
      ;;
  }

  dimension: periods_as_customer {
    type: number
    hidden: yes
    sql: DATEDIFF({{ cohort_by._parameter_value }}, ${user_order_facts.first_order_date}, ${user_order_facts.latest_order_date})
      ;;
  }

  measure: cohort_values_0 {
    type: count_distinct
    hidden: yes
    sql: CASE WHEN {{ metric._parameter_value }} = 'Order Count' THEN ${id}
        WHEN {{ metric._parameter_value }} = 'Unique Users' THEN ${users.id}
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


view: order_items_base {
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
  measure: dynamic_metric {
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
  measure: total_sale_price {
    sql: ${sale_price} ;;
    type: sum
    drill_fields: [created_date,created_raw,total_sale_price]
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
