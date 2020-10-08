view: repeat_purchase_facts {
  derived_table: {
    sql: SELECT
        order_items.order_id
        , COUNT(DISTINCT repeat_order_items.id) AS number_subsequent_orders
        , MIN(repeat_order_items.created_at) AS next_order_date
        , MIN(repeat_order_items.order_id) AS next_order_id
      FROM public.order_items
      LEFT JOIN public.order_items repeat_order_items
        ON order_items.user_id = repeat_order_items.user_id
        AND order_items.created_at < repeat_order_items.created_at
        -- comment
      GROUP BY 1
      -- order id |  date 1    | date 2
      --    1     | 2019-01-01 | 2019-01-02
       ;;
    sortkeys: ["order_id"]
    distribution: "order_id"
#     datagroup_trigger: ecommerce_etl

    persist_for: "8 hours"
#     sql_trigger_value: SELECT max(id) from ETL_LOG ;;

  }

  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: next_order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.next_order_id ;;
  }

  dimension: has_subsequent_order {
    type: yesno
    sql: ${next_order_id} > 0 ;;
  }

  dimension: number_subsequent_orders {
    type: number
    sql: ${TABLE}.number_subsequent_orders ;;
  }

  dimension_group: next_order {
    type: time
    timeframes: [raw, date]
    hidden: yes
    sql: ${TABLE}.next_order_date ;;
  }
}
