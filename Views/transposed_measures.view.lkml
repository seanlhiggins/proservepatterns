include: "order_items.view.lkml"
view: transposed_measures {
  derived_table: {
    sql:
    with digit as (
      select 0 as d union all
      select 1 union all select 2 union all select 3
      )
      ,
    hardcoded_transposed_measure_values AS
      (SELECT CASE WHEN d = 1 THEN 'total_revenue'
      WHEN d = 2 THEN 'gross_margin'
      WHEN d = 3 THEN 'total_cost'
      ELSE 'what_even_is_this'
      END
      AS measures_as_rows
      FROM
        (SELECT d FROM digit)
      )

    SELECT measures_as_rows,order_date,

    SUM(CASE WHEN measures_as_rows = 'total_revenue' THEN total_revenue
      WHEN measures_as_rows = 'gross_margin' THEN gross_margin
      WHEN measures_as_rows = 'total_cost' THEN total_cost
      WHEN measures_as_rows = 'what_even_is_this' THEN what_even_is_this
      END) as consolidated_measure
    FROM
      ( SELECT
        measures_as_rows
      , DATE_TRUNC('day',o.created_at) as order_date
      , SUM(sale_price) as total_revenue,
        o.sale_price - i.cost as gross_margin,
        SUM(i.cost) as total_cost,
        o.sale_price + i.cost as what_even_is_this
      FROM order_items as o
      JOIN inventory_items as i
      ON o.inventory_item_id = i.id
      CROSS JOIN hardcoded_transposed_measure_values
      GROUP BY 1,2,o.sale_price,i.cost
      )
    GROUP BY 1,2

      ;;
  }
  dimension: measures_as_rows {}
  dimension: order_date {type: date}
  measure: consolidated_metric {
    type: sum
    sql: ${TABLE}.consolidated_measure ;;
    value_format_name: usd
  }
}
# explore: transposed_measures {}
