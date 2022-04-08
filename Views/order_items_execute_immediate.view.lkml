explore: order_items_execute_immediate {}
view: order_items_execute_immediate {
  derived_table: {
    create_process: {
      sql_step:
      DECLARE t1 string;
      set t1="thelook.order_items";
      EXECUTE IMMEDIATE FORMAT("CREATE OR REPLACE VIEW ${SQL_TABLE_NAME} AS select * from %s",t1); ;;
    }
    persist_for: "1 seconds"
  }
  dimension: test {sql:1;;}
}
