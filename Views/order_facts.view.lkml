include: "../Models/thelook_shiggins.model.lkml"
view: order_facts {
  derived_table: {
#     explore_source: order_items {
#       column: order_id {}
#       column: items_in_order { field: order_items.count }
#       column: order_amount { field: order_items.total_sale_price }
#       column: order_cost { field: inventory_items.total_cost }
#       column: user_id {field: order_items.user_id }
#       column: created_at {field: order_items.created_raw}
#       column: order_gross_margin {field: order_items.total_gross_margin}
#       derived_column: order_sequence_number {
#         sql: RANK() OVER (PARTITION BY user_id ORDER BY created_at) ;;
#       }
#     }
#ndt build failing with blank from clause...
datagroup_trigger: ecommerce_etl
sql:
SELECT
  order_items.order_id  AS order_id,
  COUNT(DISTINCT order_items.id ) AS items_in_order,
  COALESCE(SUM(order_items.sale_price ), 0) AS order_amount,--"order_items.total_sale_price",
  COALESCE(SUM(inventory_items.cost ), 0) AS order_cost,--"inventory_items.total_cost",
  order_items.user_id  AS user_id,
  order_items.created_at AS created_at,
  COALESCE(SUM((order_items.sale_price - inventory_items.cost) ), 0) AS order_gross_margin,--"order_items.total_gross_margin",
  RANK() OVER (PARTITION BY user_id ORDER BY order_items.created_at) as order_sequence_number
FROM public.order_items  AS order_items
FULL OUTER JOIN public.inventory_items  AS inventory_items ON inventory_items.id = order_items.inventory_item_id

GROUP BY 1,5,6
;;

distribution_style: all
  }
  dimension: order_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: items_in_order {
    type: number
    sql: ${TABLE}.items_in_order ;;
  }

  dimension: order_amount {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_amount ;;
  }

  dimension: order_cost {
    type: number
    value_format_name: usd
    sql: ${TABLE}.order_cost ;;
  }

  dimension: order_gross_margin {
    type: number
    value_format_name: usd
  }


  dimension: order_sequence_number {
    type: number
    sql: ${TABLE}.order_sequence_number ;;
  }

  dimension: is_first_purchase {
    type: yesno
    sql: ${order_sequence_number} = 1 ;;
  }
}
