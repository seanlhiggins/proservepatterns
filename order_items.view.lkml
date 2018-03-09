view: order_items {
  sql_table_name: public.ORDER_ITEMS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
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
    # hidden: yes
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


  parameter: metric_selector {
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


  parameter: month_name {
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

  parameter: view_label {
    type: unquoted
    default_value: "TEST"
  }

  dimension: parameter_pass_through {
    sql: {% parameter view_label %} ;;
  }

  dimension: test {
    view_label: "{% parameter view_label %}"
    sql: 1 ;;
  }

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
