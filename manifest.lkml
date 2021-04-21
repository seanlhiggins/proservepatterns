# release 1.0
project_name: "shiggins"
# project_name: "data-portal"
visualization: {
  id: "shiggins_scatter"
  label: "Scatter 2"

  # url: "http://localhost:8080/dist/scatterplot.js"
  file: "dist/scatterplot.js"
  dependencies: ["https://cdn.plot.ly/plotly-latest.min.js"]
}
application: dash-mgmt {
  label: "Dashboard Governance"
  file: "dashboard-mgmt.js"
  # url: "http://localhost:8080/bundle.js"

  entitlements: {
    use_embeds: yes
    use_form_submit: yes
    local_storage: yes
    core_api_methods: [
      "me",
      "all_user_attributes",
      "user_attribute_user_values",
      "create_user_attribute",
      "update_user_attribute",
      "user_roles",
      "all_boards",
      "board",
      "run_inline_query",
      "run_query",
      "dashboard"
    ]
  }
}

application: data-portal {
  label: "Shiggins Test Extension"
  # file: "dist/data-portal.js"
  url: "http://localhost:8080/dist/data-portal.js"

  entitlements: {
    use_embeds: yes
    use_form_submit: yes
    core_api_methods: [
      "me",
      "all_user_attributes",
      "user_attribute_user_values",
      "create_user_attribute",
      "update_user_attribute",
      "user_roles",
      "all_boards",
      "board"
    ]
  }
}

constant: CONNECTION_NAME {
  value: "snowlooker"
  export: override_required
}
# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
application: extension-demo {
  label: "PS EMEA Offsite"
  # url: "https://localhost:8080/bundle.js"
  url: "http://localhost:8080/bundle.js"

}

# localization_settings: {
#   default_locale: en
#   localization_level: permissive
# }

constant: averate_tat_san_fran_general {
  value: "Average Turnaround Time"
  }

constant: conversation_constant_tooltip {
  value: "html"
}

visualization: {
  id: "mult-gauge-custom-viz"
  file: "multiple_gauge_chart.js"
  label: "Multiple Gauge Chart"
}

constant: impressions_clicks_tooltip{
  value: "{% if _explore._name  =='order_items' %}<ul>
  <li>Imps: {{users.count._rendered_value}}</li>
  <li>Clicks: {{order_items.count._rendered_value}}</li>
  <li>Bookings: {{order_items.total_sale_price._rendered_value}}</li>
  <li>Br Imps: {{order_items.average_sale_price._rendered_value}}</li>

  </ul>
  {% elsif _explore._name == 'users' %}
  <ul>
  <li>Imps: {{users.count._rendered_value}}</li>
  </ul>
  {% else %}
  {{ rendered_value }} {{_explore._name._value}}
  {% endif %}"
}
