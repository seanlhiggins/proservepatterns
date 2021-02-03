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
  value: "Average Turnaround Time"}

visualization: {
  id: "mult-gauge-custom-viz"
  file: "multiple_gauge_chart.js"
  label: "Multiple Gauge Chart"
}
