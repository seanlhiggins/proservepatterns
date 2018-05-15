view: users_extended {
  extends: [users]
  dimension: email {
    hidden: yes
  }
}

view: users {
  sql_table_name: public.USERS ;;
  dimension: email {
    type: string
    sql: ${TABLE}.EMAIL ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  parameter: set_variable {
    allowed_value: {
      value: "detail"
      label: "detal"
    }
    default_value: "detail"
  }
  dimension: age {
    type: number
    sql: ${TABLE}.AGE ;;
  }

  # dimension: age_tier {
  #   type: tier
  #   sql: ${age} ;;
  # }

  measure: average_age {
    type: average
    sql: ${age} ;;
  }
  dimension: city {
    type: string
    sql: ${TABLE}.CITY ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.COUNTRY ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.CREATED_AT ;;
  }



  dimension: first_name {
    type: string
    sql: ${TABLE}.FIRST_NAME ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.GENDER ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.LAST_NAME ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.LATITUDE ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.LONGITUDE ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.STATE ;;
    map_layer_name: us_states
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.TRAFFIC_SOURCE ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.ZIP ;;
  }

  dimension: nr_of_orders {
    sql: (SELECT count(id)  as nr_of_orders
   FROM public.ORDER_ITEMS) ;;
  }


  parameter: first_name_filter {}
  measure: total_number_named {
    label: "Total Users Named {% parameter first_name_filter %}"
    type: count_distinct
    sql: {% condition first_name_filter %} ${first_name} {% endcondition %} ;;
  }
  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }

  set: detail {
    fields: [id, last_name, first_name, events.count, order_items.count]

  }
}
