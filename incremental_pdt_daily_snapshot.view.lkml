view: order_items_yesterday_data {
  derived_table: {
    explore_source: order_items {
      column: pk2_created_date { field: order_items.created_date}
      column: pk2_brand { field: products.brand }
      column: total_orders {field: order_items.count }
      filters: {
        field: order_items.created_date
        value: "1 days ago for 1 day"
      }
    }
  }
}

explore: order_items_table_date {}
view: order_items_table_date {
  derived_table: {
    datagroup_trigger: ecommerce_etl
    create_process: {
      sql_step: CREATE TABLE profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 86400 | date: "%Y%m%d" }} AS ${order_items_yesterday_data.SQL_TABLE_NAME} ;;
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} AS SELECT 1 ;;
    }
  }
  dimension: pk2_created_date {}
  dimension: pk2_brand {}
  dimension: total_orders {}
}
