explore: etl_checker {}
view: etl_checker {
  derived_table: {
    ## Change this to something like sql: SELECT max(etl_date) as etl_date FROM etl_logs ;;
    sql: SELECT (CURRENT_DATE -4) as etl_date ;;
  }

  dimension: etl_date {
    type: date
    sql: ${TABLE}.etl_date ;;
  }
}

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
    label: "average_conversion"
    type: average
    sql: ${age} ;;
    html:
     <div style="float: left
          ; width:100%
          ; background-color: rgba(200,0,0,0.{{100 | times:value}})
          ; text-align:left
          ; color: #FFFFFF
          ; border-radius: 5px"> <p style="margin-bottom: 0; margin-left: 4px;">{{ value }}</p>
          </div>
         ;;
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

  dimension: country_array {
    label: "City Array"
    sql: {% assign city_array_fr = _user_attributes.['new_york']%}
    {% assign city_array_de = _user_attributes.['santa_cruz'] %}
    {% assign city_array_full = '' | append: city_array_fr | append:',' |append: city_array_de %}
    {% for city in city_array_full %}
    '{{ city }}'
    {% endfor %}
    ;;
# '- {{ item }}'
  }

# {% assign today_date = 'now' | date: '%s' %}
# {% assign pre_date = product.metafields.Release-Date.preOrder | date: '%s' %}
# {% if today_date > pre_date %}




  filter: date_filter {
    type: date
    sql:
    CASE WHEN
    DATEDIFF(day, ({% date_start date_filter %})::date,({% date_end date_filter %})::date) = 1 THEN
    ({% date_start date_filter %})::date = ${created_date}
    ELSE
    {% condition date_filter %} DATEADD(day,${etl_date_diff},${created_date}) {% endcondition %}
    END
;;
  }

  dimension: etl_date_diff{
    type: number
#     --datediff(day,${etl_checker.etl_date_date},{% date_end date_filter %})
    sql: 1
    ;;
    }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }
  dimension_group: unadjusted_created {
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
    sql:${TABLE}.CREATED_AT ;;}


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
    html: <b>{{rendered_value}}</b> ;;
  }
  measure: name_list {
    type: list
    list_field: first_name
    html: <b>{{value}}</b> ;;
  }

  set: detail {
    fields: [id, last_name, first_name, events.count, order_items.count]

  }
}
