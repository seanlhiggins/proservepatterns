include: "../Models/thelook_shiggins.model"

explore: +order_items {
  aggregate_table: users_created_date_ts {
    query: {
      dimensions: [users.created_date,users.traffic_source]
      measures: [order_items.total_sale_price,users.average_age,order_items.average_sale_price,order_items.total_gross_margin]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      sql_trigger_value: SELECT CURRENT_DATE ;;
    }
  }
}
