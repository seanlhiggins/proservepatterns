connection: "thelook_events_redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: default {
  sql_trigger: SELECT CURRENT_DATE;;
  max_cache_age: "1 hour"
}

# label: "{% if _user_attributes['brand'] == 'Calvin Klein' %} Calvin Klein
#             {% elsif _user_attributes['brand'] == 'Calvin Klein Jeans' %} Calvin Klein
#             {% else %} OTHER {% endif %}"

persist_with: default
#test

# New User Retention Analyses:
explore: user_growth_base {
  description: "User Retention Analysis. Straight forward explore. No parameters."
  #   extension: required
  from: user_growth
  view_name: user_growth
}
explore: parameter_intervals {
  description: "User Retention Analysis with dynamic parameters."

}

explore: interval_windows {}

explore: distribution_centers {}

explore: active_users {
  join: users {
    type: left_outer
    sql_on: ${active_users.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users_extended {

  view_name: users {
    sql_table_name: {% if _user_attributes['users_table']=='extended' %}
  ${users_extended.SQL_TABLE_NAME}
  {% else %}
  public.users
  {% endif %} ;;
  }

}


explore: order_items {

# access_filter: {
#   field: products.brand
#   user_attribute: brand
# }
  join: order_items_repurchase_facts {
    view_label: "{% if _user_attributes['customer'] == 'A' %}Don't use these!
            {% elsif _user_attributes['customer'] == 'B' %}To be Deprecated
            {% else %}Repurchase Facts {% endif %}"
    type: left_outer
    sql_on: ${order_items.id}=${order_items_repurchase_facts.order_id} ;;
    relationship: one_to_one
  }
  join: inventory_items_1 {
    view_label: "Inventory"
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items_1.id} ;;
    relationship: many_to_one
  }

  join: users {
    view_label: "Customers"
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items_1.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }

  join: top_5_countries {
    view_label: "Countries"
    sql_on: ${top_5_countries.country_code} = ${users.country} ;;
    type: inner
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: users {
  fields: [ALL_FIELDS*, -set_variable]

}

explore: calendar {
  label: "Interval Active Users"
  join: users {
    sql_on: ${calendar.date_date} = ${users.created_date};;
    type: inner
    relationship: one_to_many
  }
  join: interval_windows_prev {
    from: interval_windows
    sql_on: ${calendar.date_date}-30 between ${interval_windows_prev.start_date} AND ${interval_windows_prev.end_time_date}
    AND ${users.id} = ${interval_windows_prev.user_id};;
    relationship: one_to_many
  }
  join: interval_windows_curr {
    from: interval_windows
    sql_on: ${calendar.date_date} between ${interval_windows_curr.start_date} AND ${interval_windows_curr.end_time_date}
      AND ${users.id} = ${interval_windows_curr.user_id};;
    relationship: one_to_many

  }
}
