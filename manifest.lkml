project_name: "shiggins"

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
