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
#     sql_trigger_value: SELECT CURRENT_DATE ;;
    create_process: {
      sql_step: DROP TABLE IF EXISTS profservices_scratch.oi_snapshot_date_{{'now' | date: "%s" | minus : 86400 | date: "%Y%m%d" }};;
      sql_step: CREATE TABLE profservices_scratch.oi_snapshot_date_{{'now' | date: "%s" | minus : 86400 | date: "%Y%m%d" }} AS ${order_items_yesterday_data.SQL_TABLE_NAME} ;;
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} AS SELECT * FROM profservices_scratch.oi_snapshot_date_{{'now' | date: "%s" | minus : 86400 | date: "%Y%m%d" }} ;;

    }

  }
  dimension: pk2_created_date {}
  dimension: pk2_brand {}
  dimension: total_orders {}
}


### CREATE A PROCESS TO ROLL UP EACH OF THE DAILY PDTs TO A WEEKLY SUMMARY SO YOU CAN DO PROGRESS REPORTING

explore: order_items_table_week {}
view: order_items_table_week {
  derived_table: {
#     sql_trigger_value: SELECT DATE_TRUNC('week',CURRENT_DATE) ;;
    create_process: {
      sql_step: DROP TABLE IF EXISTS profservices_scratch.oi_snapshot_weekly_summary_{{'now' | date: "%s" | minus : 604800 | date: "%Y%m%U" }};;
      sql_step:  CREATE TABLE profservices_scratch.oi_snapshot_weekly_summary_{{'now' | date: "%s" | minus : 604800 | date: "%Y%m%U" }} AS
    SELECT * FROM profservices_scratch.oi_snapshot_date_{{'now' | date: "%s" | minus : 86400 | date: "%Y%m%d" }}
    UNION ALL
    SELECT * FROM profservices_scratch.oi_snapshot_date_{{'now' | date: "%s" | minus : 172800 | date: "%Y%m%d" }}
--    UNION ALL
--    SELECT * FROM profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 259200 | date: "%Y%m%d" }}
--    UNION ALL
--    SELECT * FROM profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 345600 | date: "%Y%m%d" }}
--    UNION ALL
--    SELECT * FROM profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 432000 | date: "%Y%m%d" }}
--    UNION ALL
--    SELECT * FROM profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 518400 | date: "%Y%m%d" }}
--    UNION ALL
--    SELECT * FROM profservices_scratch.oi_snapshot_{{'now' | date: "%s" | minus : 604800 | date: "%Y%m%d" }}
    ;;
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} AS SELECT * FROM profservices_scratch.oi_snapshot_weekly_summary_{{'now' | date: "%s" | minus : 604800 | date: "%Y%m%U" }} ;;

  }
}
  dimension: pk2_created_date {}
  dimension: pk2_brand {}
  measure: total_orders {type:sum}
}
