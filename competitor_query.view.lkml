view: competitor_query {
  derived_table: {
    sql: with brand as (SELECT
        users.country,
        TRIM(products.brand)  AS brand,
        COUNT(DISTINCT order_items.id ) AS total
      FROM public.order_items  AS order_items
      LEFT OUTER JOIN users on users.id = order_items.user_id
      LEFT OUTER JOIN public.inventory_items  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
      LEFT JOIN public.products  AS products ON products.id = inventory_items.product_id
      WHERE {% condition order_items.product_brand_filter %} TRIM(products.brand) {% endcondition %}
      AND  {% condition users.country %}users.country {% endcondition %}
      AND {% condition order_items.created_date %} order_items.created_at {% endcondition %}

      GROUP BY 1,2
      )

      SELECT
        ROW_NUMBER() OVER(ORDER BY abs(total_orders - brand_total)) -1 AS rank,
        abs(total_orders-brand_total) as orders_diff,
        brand,
        total_orders as competitor_total,
        brand_total as own_brand_total
      FROM
      (

      SELECT
        TRIM(products.brand)  AS brand,
        users.country,
        COUNT(DISTINCT order_items.id ) as total_orders,
        brand.total as brand_total
      FROM public.order_items  AS order_items
      LEFT OUTER JOIN users on users.id = order_items.user_id
      LEFT OUTER JOIN public.inventory_items  AS inventory_items ON inventory_items.id = order_items.inventory_item_id
      LEFT JOIN public.products  AS products ON products.id = inventory_items.product_id
      LEFT JOIN brand ON brand.country = users.country
      WHERE
      {% condition order_items.created_date %} order_items.created_at {% endcondition %}
      GROUP BY 1,2, brand.total
      ORDER BY 3

      )
      ORDER BY 2 asc

      LIMIT 5
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: orders_diff {
    type: number
    sql: ${TABLE}.orders_diff ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: competitor_total {
    type: number
    sql: ${TABLE}.competitor_total ;;
  }

  dimension: own_brand_total {
    type: number
    sql: ${TABLE}.own_brand_total ;;
  }

  set: detail {
    fields: [rank, orders_diff, brand, competitor_total, own_brand_total]
  }
}
