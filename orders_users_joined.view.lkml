explore: orders_users_joined {}
view: orders_users_joined {
  derived_table: {
    sql: SELECT oi.*, users.*
    FROM order_items oi
    LEFT JOIN users
    ON oi.country = users.country;;
  persist_for: "12 hours"
  }
  dimension: user_id {}
  dimension: order_id {}
}

explore: orders_tall_by_customer {}
view: orders_tall_by_customer {
  derived_table: {
    sql: SELECT CASE WHEN customer_id = 1 THEN customer_name END as customer_a
    FROM order_items
    JOIN inventory_items
    ON oi.inventory_item_id = inventory_items.sku_id;;
  persist_for: "12 hours"
  }
  dimension: customer_a {}
}
