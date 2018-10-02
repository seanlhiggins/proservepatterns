connection: "thelook_events_redshift"
#
# # include all the views
# include: "*.view"
#
# # include all the dashboards
# include: "*.dashboard"
#
# datagroup: default {
#   sql_trigger: SELECT CURRENT_DATE;;
#   max_cache_age: "1 hour"
# }
#
# # explore: order_items_de {
# #   extends: [order_items]
# #   label: "Deutsche"
# #   fields: [ALL_FIELDS*,-total_sale_price]
# # }
#
# # explore: users_order_items {
# #   from: users
# #   extends: [users,order_items]
# #   join: order_items {
# #     sql_on: ${users.id} = ${order_items.user_id} ;;
# #   }
# # }
# access_grant: calvin_klein {
#   allowed_values: ["Calvin Klein"]
#   user_attribute: brand
# }
#
# explore: products {
#
#   # sql_always_where: ${brand} = 'Allegra K' AND ${category} = 'Jeans';;
# }
#
#   explore: order_items {
#     label: "(1) Orders, Items and Users"
#     view_name: order_items
#     # sql_always_where: ${created_week} = TO_CHAR(DATE_TRUNC('week', DATE_ADD('day',-{{order_items.week_selector._parameter_value}},CURRENT_DATE)),'YYYY-MM-DD') ;;
#
#     join: inventory_items {
#       #Left Join only brings in items that have been sold as order_item
#       type: full_outer
#       relationship: one_to_one
#       sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
#     }
#
#     join: users {
#       relationship: many_to_one
#       sql_on: ${order_items.user_id} = ${users.id} ;;
#     }
#
#     join: products {
#       relationship: many_to_one
#       sql_on: ${products.id} = ${inventory_items.product_id} ;;
#       }
# }
#
# explore: users {
#   sql_always_where: ${city} = 'New York' ;;
# }
#
#
# explore: pop {
# #   from:  pop/
# #   view_name: pop
#   join: within_periods { #No editing needed
#     from: numbers
#     type: left_outer
#     relationship: one_to_many
#     fields: []
#     sql_on: ${within_periods.n}
#             <= DATEDIFF( {% parameter pop.within_period_type %},{% date_start pop.date_filter %},{% date_end pop.date_filter %} )
#               * CASE WHEN {%parameter pop.within_period_type %} = 'hour' THEN 24 ELSE 1 END;;
#   }
#   join: over_periods { #No editing needed
#     from: numbers
#     view_label: "[PoP]"
#     type: left_outer
#     relationship: one_to_many
#     sql_on:
#         CASE WHEN {% condition pop.over_how_many_past_periods %} NULL {% endcondition %}
#         THEN
#           ${over_periods.n} <= 1
#         ELSE
#           {% condition pop.over_how_many_past_periods %} ${over_periods.n} {% endcondition %}
#         END;;
#   }
#   #Rename (& optionally repeat) below join to match your pop view(s)
#   join: pop_order_items_created {
#     type: left_outer
#     relationship: many_to_one
#     #Apply join name below in sql_on
#     sql_on: pop_order_items_created.join_date = DATE_TRUNC({% parameter pop.within_period_type %},
#           DATEADD({% parameter pop.over_period_type %}, 0 - ${over_periods.n},
#               DATEADD({% parameter pop.within_period_type %}, 0 - ${within_periods.n},
#                   {% date_end pop.date_filter %}
#               )
#           )
#       );;
#   }
#   join: pop_order_items_delivered {
#     type: left_outer
#     relationship: many_to_one
#     #Apply join name below in sql_on
#     sql_on: pop_order_items_delivered.join_date = DATE_TRUNC({% parameter pop.within_period_type %},
#           DATEADD({% parameter pop.over_period_type %}, 0 - ${over_periods.n},
#               DATEADD({% parameter pop.within_period_type %}, 0 - ${within_periods.n},
#                   {% date_end pop.date_filter %}
#               )
#           )
#       );;
#   }
#   #No editing needed below
#   always_join: [within_periods,over_periods]
#   always_filter: {
#     filters: {
#       field: pop.date_filter
#       value: "last 12 weeks"
#     }
#     filters: {
#       field: pop.within_period_type
#       value: "week"
#     }
#     filters: {
#       field: pop.over_period_type
#       value: "year"
#     }
#   }
# }
# # label: "{% if _user_attributes['brand'] == 'Calvin Klein' %} Calvin Klein
# #             {% elsif _user_attributes['brand'] == 'Calvin Klein Jeans' %} Calvin Klein
# #             {% else %} OTHER {% endif %}"
#
# persist_with: default
# #test
#
# # New User Retention Analyses:
# explore: user_growth_base {
#   description: "User Retention Analysis. Straight forward explore. No parameters."
#   #   extension: required
#   from: user_growth
#   view_name: user_growth
# }
# explore: parameter_intervals {
#   description: "User Retention Analysis with dynamic parameters."
#
# }
# explore: inventory_items{
#   join: products {
#     sql_on: ${products.id} = ${inventory_items.product_id} ;;
#     relationship: many_to_one
#     type: left_outer
#   }
# }
# explore: interval_windows {}
#
# explore: distribution_centers {}
#
# # explore: active_users {
# #   join: users {
# #     type: left_outer
# #     sql_on: ${active_users.user_id} = ${users.id} ;;
# #     relationship: many_to_one
# #   }
# # }
#
# explore: events {
#   fields: [ALL_FIELDS*, -users.etl_date_diff]
#   join: users {
#     type: left_outer
#     sql_on: ${events.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: users_extended {
#
#     fields: [ALL_FIELDS*, -users.etl_date_diff]
#   view_name: users {
#     sql_table_name: {% if _user_attributes['users_table']=='extended' %}
#   ${users_extended.SQL_TABLE_NAME}
#   {% else %}
#   public.users
#   {% endif %} ;;
#   }
#
# }
#
#
#
#
#
#
# explore: calendar {
#   fields: [ALL_FIELDS*, -users.etl_date_diff]
#   label: "Interval Active Users"
#   join: users {
#     sql_on: ${calendar.date_date} = ${users.created_date};;
#     type: inner
#     relationship: one_to_many
#   }
#   join: interval_windows_prev {
#     from: interval_windows
#     sql_on: ${calendar.date_date}-30 between ${interval_windows_prev.start_date} AND ${interval_windows_prev.end_time_date}
#     AND ${users.id} = ${interval_windows_prev.user_id};;
#     relationship: one_to_many
#   }
#   join: interval_windows_curr {
#     from: interval_windows
#     sql_on: ${calendar.date_date} between ${interval_windows_curr.start_date} AND ${interval_windows_curr.end_time_date}
#       AND ${users.id} = ${interval_windows_curr.user_id};;
#     relationship: one_to_many
#
#   }
# }
