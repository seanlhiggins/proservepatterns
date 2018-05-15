- dashboard: i__looker_users
  title: i__looker_USERS
  layout: newspaper
  elements:
  - title: OS used
    name: OS used
    model: i__looker
    explore: session
    type: looker_pie
    fields:
    - user.count
    - session.operating_system
    sorts:
    - user.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    colors:
    - 'palette: Tomato to Steel Blue'
    series_colors:
      OS X 10.13.4: "#bc2621"
      OS X 10.13.3: "#87130a"
      OS X 10.13.2: "#e74b4b"
      OS X 10.12.6: "#c96741"
      ChromeOS 10176.73.0: "#f1a792"
      ChromeOS 10323.67.0: "#e7bdb8"
      OS X 10.13.1: "#ead6d3"
    row: 12
    col: 5
    width: 8
    height: 6
  - title: Browser
    name: Browser
    model: i__looker
    explore: session
    type: looker_pie
    fields:
    - user.count
    - session.browser
    sorts:
    - user.count desc
    limit: 500
    query_timezone: America/Los_Angeles
    value_labels: legend
    label_type: labPer
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Chrome: "#bb1034"
    row: 12
    col: 13
    width: 10
    height: 6
  - title: New Tile
    name: New Tile
    model: i__looker
    explore: user
    type: single_value
    fields:
    - user.count
    - user.is_disabled
    filters:
      user.is_disabled: 'No'
    sorts:
    - user.count desc
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Active Users Count
    row: 0
    col: 0
    width: 5
    height: 3
  - title: Power Users
    name: Power Users
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - user.first_name
    - user.last_name
    - query.count
    sorts:
    - query.count desc
    limit: 10
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    hidden_points_if_no: []
    hidden_fields:
    series_colors:
      query.count: "#bb1034"
    row: 0
    col: 5
    width: 8
    height: 6
  - title: Non Active Users
    name: Non Active Users
    model: i__looker
    explore: history
    type: table
    fields:
    - user.first_name
    - user.last_name
    - history.most_recent_query_date
    - user.email
    filters:
      history.most_recent_query_date: before 2 months ago
    sorts:
    - history.most_recent_query_date
    limit: 10
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    hidden_points_if_no: []
    hidden_fields:
    series_labels:
      history.most_recent_query_date: Most Recent Query Date
    row: 0
    col: 13
    width: 10
    height: 6
  - title: Most Active Developer
    name: Most Active Developer
    model: i__looker
    explore: event
    type: looker_column
    fields:
    - event.count
    - user.first_name
    - user.last_name
    filters:
      event.category: git
    sorts:
    - event.count desc
    limit: 10
    row_total: right
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: white
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      event.count: "#bb1034"
    row: 6
    col: 13
    width: 10
    height: 6
  - title: Most Active Scheduler
    name: Most Active Scheduler
    model: i__looker
    explore: scheduled_plan
    type: looker_column
    fields:
    - user.first_name
    - user.last_name
    - scheduled_plan.count
    filters:
      scheduled_plan.run_once: 'no'
    sorts:
    - scheduled_plan.count desc
    limit: 10
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      scheduled_plan.count: "#bb1034"
    row: 6
    col: 5
    width: 8
    height: 6
  - title: One Tile
    name: One Tile
    model: i__looker
    explore: scheduled_plan
    type: single_value
    fields:
    - scheduled_plan.count
    filters:
      scheduled_plan.run_once: 'no'
    sorts:
    - scheduled_plan.count desc
    limit: 10
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    series_colors:
      scheduled_plan.count: "#bb1034"
    single_value_title: Schedules Count
    row: 6
    col: 0
    width: 5
    height: 3
  - title: Dev and Admins
    name: Dev and Admins
    model: i__looker
    explore: user
    type: single_value
    fields:
    - user.count
    filters:
      role.name: Developer,Admin
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Developers and Admins
    row: 3
    col: 0
    width: 5
    height: 3
  - title: Two Tile
    name: Two Tile
    model: i__looker
    explore: dashboard
    type: single_value
    fields:
    - dashboard.count
    limit: 500
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    single_value_title: Dashboards Count
    row: 9
    col: 0
    width: 5
    height: 3
