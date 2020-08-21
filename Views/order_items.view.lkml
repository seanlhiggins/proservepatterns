# If necessary, uncomment the line below to include explore_source.
# include: "thelook_shiggins.model.lkml"
#test comment

view: +order_items {
  #marketing view
  measure: new_kpi {
    sql: 1 ;;
  }
}

view: +order_items {
  #custom stuff
  dimension: custom_age {
    sql: age_tier ;;
  }
}

 view: order_items {
    sql_table_name: public.order_items ;;

    ########## IDs, Foreign Keys, Counts ###########
  dimension: date_start_this_period {
    type: date_raw
    sql: {% date_start previous_period_filter %} ;;
  }

  dimension: liquid {
    sql:
    {% if users._in_query %}
        {% unless users.age._in_query %}
        0
        {% else %}
        1
        {% endunless %}
    {% else %}
    0
    {% endif %};;
  }

  dimension: date_end_this_period {
    type: date_raw
    sql: {% date_end previous_period_filter %} ;;
  }

  dimension: days_in_period {
    hidden: yes
    type: duration_day
    sql_start: ${date_start_this_period} ;;
    sql_end: ${date_end_this_period} ;;
  }

  dimension: day_in_period {
    type: duration_day
    view_label: "Previous Period Example"
    sql_start: CASE WHEN ${created_date::datetime} >= ${date_start_this_period}
                        THEN ${date_start_this_period}
                      WHEN ${created_date::datetime} >= ${date_start_previous_period}
                        THEN ${date_start_previous_period} END ;;
    sql_end: ${created_date::datetime} ;;
  }

  dimension: date_start_previous_period {
    type: date_raw
    sql: DATEADD(day,-1*${days_in_period},${date_start_this_period}) ;;
  }

  dimension: date_end_previous_period {
    type: date_raw
    sql: DATEADD(day,-1*${days_in_period},${date_end_this_period}) ;;
  }

  filter: previous_period_filter {
    view_label: "Previous Period Example"
    type: date
    description: "Use this filter for period analysis"
    sql:    ${created_date::datetime} >= ${date_start_previous_period}
      AND ${created_date::datetime} < ${date_end_this_period} ;;
  }

  dimension: previous_period {
    view_label: "Previous Period Example"
    type: string
    description: "The reporting period as selected by the Previous Period Filter"
    sql:
      CASE
        WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is not null /* date ranges or in the past x days */
          THEN
            CASE
              WHEN ${created_date::datetime} >=  ${date_start_this_period}
                AND ${created_date::datetime} < ${date_end_this_period}
                THEN 'This Period'
              WHEN ${created_date::datetime} >= ${date_start_previous_period}
                AND ${created_date::datetime} <  ${date_end_previous_period}
                THEN 'Previous Period'
            END
        WHEN {% date_start previous_period_filter %} is null AND {% date_end previous_period_filter %} is null /* has any value or is not null */
          THEN CASE WHEN ${created_date::datetime} is not null THEN 'Has Value' ELSE 'Is Null' END
        WHEN {% date_start previous_period_filter %} is null AND {% date_end previous_period_filter %} is not null /* on or before */
          THEN
            CASE
              WHEN  ${created_date::datetime} <=  {% date_end previous_period_filter %} THEN 'In Period'
              WHEN  ${created_date::datetime} >   {% date_end previous_period_filter %} THEN 'Not In Period'
            END
       WHEN {% date_start previous_period_filter %} is not null AND {% date_end previous_period_filter %} is null /* on or after */
         THEN
           CASE
             WHEN  ${created_date::datetime} >= {% date_start previous_period_filter %} THEN 'In Period'
             WHEN  ${created_date::datetime} < {% date_start previous_period_filter %} THEN 'Not In Period'
          END
      END ;;
  }

  parameter: text_search_string {
    type: string

  }
  # filter: text_search_function {
  #   sql: CONTAINS(text_field, {{ text_search_string._parameter_value }},1) >0 ;;
  # }

    filter: product_brand_filter {
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





    dimension: order_id {
      type: string
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
      timeframes: [time, hour, date, week, month, year, hour_of_day, quarter,day_of_week, day_of_month, month_num, month_name, raw, week_of_year]
      sql:
      ${TABLE}.created_at ;;
      convert_tz: no
    }

    dimension: is_peak {
      type: yesno
      sql: ${created_hour_of_day} > 7 AND ${created_hour_of_day} < 19 ;;
    }

    measure: orders_on_peak {
      label: "Avg Price Peak"
      type: average
      sql: ${sale_price} ;;
      filters: [is_peak: "yes"]
      value_format_name: usd
    }
  measure: orders_off_peak {
    label: "Avg Price Off-Peak"
    type: average
    sql: ${sale_price} ;;
    filters: [is_peak: "no"]
    value_format_name: usd
  }

      parameter: date_granularity {
        type: unquoted
        allowed_value: { value: "Daily" }
        allowed_value: { value: "Monthly" }
        allowed_value: { value: "Quarterly" }
        allowed_value: { value: "Yearly" }
        }
      dimension: date_breakdown {
        label_from_parameter: date_granularity
        sql:
               {% if date_granularity._parameter_value == "Daily" %}
                   ${created_date}::VARCHAR
               {% elsif date_granularity._parameter_value == "Monthly" %}
                   ${created_month}::VARCHAR
                {% elsif date_granularity._parameter_value == "Quarterly" %}
                   ${created_quarter}::VARCHAR
                {% elsif date_granularity._parameter_value == "Yearly" %}
                  ${created_year}::VARCHAR
              {% else %}
                   NULL
               {% endif %};;
      }

    dimension: date_pivot {
      description: "PIVOT ME!"
      sql:
             {% if date_granularity._parameter_value == "Hourly" %}
                 ${created_day_of_week}
             {% elsif date_granularity._parameter_value == "Daily" %}
                 ${created_week_of_year}
              {% elsif date_granularity._parameter_value == "Monthly" %}
                 ${created_year}
            {% else %}
                 NULL
             {% endif %};;
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
      link: {
        icon_url: "https://res-4.cloudinary.com/crunchbase-production/image/upload/c_lpad,h_256,w_256,f_auto,q_auto:eco/v1488912560/pzxig8e5r2nbgx2orr6y.png"
        url: "https://cimpress.alation.com/column?q={{ _field._name }}"
        label: "Go to column in data catalogue"
      }
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

    parameter: sales_cost {
      type: unquoted
      allowed_value: {value:"Sales"}
      allowed_value: {value:"Cost"}
      }

########## Return Information ##########

    dimension: is_returned {
      type: yesno
      sql: ${returned_raw} IS NOT NULL ;;
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
  measure: item_gross_margin_perc {
    type: number
    sql: ${gross_margin} ;;
    value_format_name: percent_1
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
  measure: total_sale_price {
    type: sum
    value_format_name: usd
    sql: ${sale_price} ;;
    # drill_fields: [detail*]

#       html:
#       {% if sales_cost._parameter_value == 'Sales' %}
#         {% if value > 10000 %}
#         <a style="color:green" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
#         {% else %}
#         <a style="color:red" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
#         {% endif %}
#       {% elsif sales_cost._parameter_value == 'Cost' %}
#         {% if value > 10000 %}
#         <a style="color:red" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
#         {% else %}
#         <a style="color:green" href="/explore/shiggins_patterns/users?fields=users.id,users.name&f[users.state]={{ _filters['users.state'] | url_encode }}">▲ {{rendered_value}}</a>
#         {% endif %}
#       {% endif %}
#
#         ;;
  }

  measure: total_gross_margin {
    type: sum
    value_format_name: usd
    sql: ${gross_margin} ;;
    drill_fields: [detail*]
    html: {{rendered_value}} $ ;;
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

  measure: test_rate {

  }

  measure: return_rate {
    type: number
#       value_format_name: percent_2
    sql: 1.0 * ${returned_count} / nullif(${count},0) ;;
    # drill_fields: [return_rate*]
  }

  measure: returned_passthrough {
    sql: ${return_rate};;
    type: number

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

  parameter: measure_selector{
    type: unquoted
    allowed_value: {value:"Brand"}
    allowed_value: {value:"Category"}
  }
  measure: dynamic_count {
    type: count_distinct
    sql: {% if measure_selector._parameter_value =='Brand' %} ${products.brand}
    {% else %} ${products.category} || {{measure_selector._parameter_value}}
    {% endif %}
    ;;
  }



########## Sets ##########

    set: detail {
      fields: [id, order_id, status, created_date, sale_price, products.brand, products.item_name, users.portrait, users.name, users.email]
    }
    set: return_detail {
      fields: [id, order_id, status, created_date, returned_date, sale_price, products.brand, products.item_name, users.portrait, users.name, users.email]
    }
  }
