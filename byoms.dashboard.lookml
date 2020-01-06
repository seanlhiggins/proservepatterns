- dashboard: byoms
  title: BYOMS
  layout: newspaper
  elements:
  - title: Hourly Cache Hit Ratio
    name: Hourly Cache Hit Ratio
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - history.created_hour_of_day
    - cached_result_query_count
    - db_result_query_count
    - history.query_run_count
    fill_fields:
    - history.created_hour_of_day
    filters: {}
    sorts:
    - history.created_hour_of_day
    limit: 500
    dynamic_fields:
    - measure: cached_result_query_count
      based_on: history.id
      type: count_distinct
      label: Cached Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "cache"
    - measure: db_result_query_count
      based_on: history.id
      type: count_distinct
      label: DB Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - table_calculation: cache_hit
      label: Cache Hit %
      expression: "${cached_result_query_count}/(${db_result_query_count}+${cached_result_query_count})"
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    series_types:
      history.query_run_count: line
    hidden_fields:
    - cached_result_query_count
    - db_result_query_count
    y_axes:
    - label:
      orientation: left
      series:
      - id: cache_hit
        name: Cache Hit %
        axisId: cache_hit
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label: ''
      orientation: right
      series:
      - id: history.query_run_count
        name: Total Query Run Count
        axisId: history.query_run_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    series_labels:
      history.query_run_count: Total Query Run Count
      cache_hit: Cache Hit %
    listen:
      History Lookback: history.created_date
    row: 21
    col: 8
    width: 8
    height: 6
  - title: PDT and Trigger Behavior By Connection
    name: PDT and Trigger Behavior By Connection
    model: i__looker
    explore: pdt_log
    type: table
    fields:
    - pdt_trigger_failures
    - pdt_create_failures
    - successful_pdt_build_count
    - pdt_log.connection
    sorts:
    - pdt_trigger_failures desc
    limit: 500
    dynamic_fields:
    - measure: pdt_trigger_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Trigger Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "trigger value error"
    - measure: pdt_create_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Create Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create cancelled error"
    - measure: successful_pdt_build_count
      based_on: pdt_log.id
      type: count_distinct
      label: Successful PDT Build Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create complete"
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    conditional_formatting:
    - type: greater than
      value: 0
      background_color:
      font_color: "#fc5858"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - pdt_trigger_failures
      - pdt_create_failures
    - type: greater than
      value: 0
      background_color:
      font_color: "#417c0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - successful_pdt_build_count
    row: 47
    col: 8
    width: 8
    height: 6
  - title: PDT Build Time Series 1
    name: PDT Build Time Series 1
    model: i__looker
    explore: pdt_log
    type: looker_column
    fields:
    - pdt_create_failures
    - successful_pdt_build_count
    - pdt_log.occur_date
    fill_fields:
    - pdt_log.occur_date
    filters:
      pdt_log.occur_date: 14 days
    sorts:
    - pdt_log.occur_date desc
    limit: 500
    dynamic_fields:
    - measure: pdt_trigger_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Trigger Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "trigger value error"
    - measure: pdt_create_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Create Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create cancelled error"
    - measure: successful_pdt_build_count
      based_on: pdt_log.id
      type: count_distinct
      label: Successful PDT Build Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create complete"
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    conditional_formatting:
    - type: greater than
      value: 0
      background_color:
      font_color: "#fc5858"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - pdt_create_failures
    - type: greater than
      value: 0
      background_color:
      font_color: "#417c0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - successful_pdt_build_count
    y_axes:
    - label: Build Count
      orientation: left
      series:
      - id: pdt_create_failures
        name: PDT Create Failures
        axisId: pdt_create_failures
      - id: successful_pdt_build_count
        name: Successful PDT Build Count
        axisId: successful_pdt_build_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    row: 35
    col: 0
    width: 8
    height: 6
  - title: Top Developers By Commits
    name: Top Developers By Commits
    model: i__looker
    explore: event
    type: table
    fields:
    - event.count
    - user
    filters:
      event.name: git_commit
      event.created_date: 30 days
    sorts:
    - event.count desc
    limit: 500
    column_limit: 50
    dynamic_fields:
    - dimension: user
      label: User
      expression: concat(${user.id}," - ",${user.email})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      event.count: Git Commit Count
      user: User (ID - Email)
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    note_state: expanded
    note_display: above
    note_text: Sourced off event explore - subject to truncation
    row: 7
    col: 16
    width: 8
    height: 6
  - title: Content Creation
    name: Content Creation
    model: i__looker
    explore: event
    type: looker_column
    fields:
    - count_of_dashboards_created
    - count_of_looks_created
    - count_of_dashboard_element
    - event.created_date
    fill_fields:
    - event.created_date
    filters:
      event.created_date: 14 days
      event.name: create_dashboard,create_look,create_dashboard_element
    sorts:
    - event.created_date
    column_limit: 50
    dynamic_fields:
    - dimension: user
      label: User
      expression: concat(${user.id}," - ",${user.email})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    - measure: count_of_dashboards_created
      based_on: event.id
      type: count_distinct
      label: Count of Dashboards Created
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${event.name} = "create_dashboard"
    - measure: count_of_looks_created
      based_on: event.id
      type: count_distinct
      label: Count of Looks Created
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${event.name} = "create_look"
    - measure: count_of_dashboard_element
      based_on: event.id
      type: count_distinct
      label: Count of Dashboard Element
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${event.name} = "create_dashboard_element"
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    series_labels:
      event.count: Git Commit Count
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    note_state: expanded
    note_display: above
    note_text: Sourced off event explore - subject to truncation
    row: 13
    col: 8
    width: 8
    height: 6
  - title: Users by Group
    name: Users by Group
    model: i__looker
    explore: user
    type: table
    fields:
    - group.name
    - user.count
    - embed_user.count
    sorts:
    - user.count desc
    limit: 500
    dynamic_fields:
    - table_calculation: standard_users
      label: Standard Users
      expression: "${user.count} - ${embed_user.count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
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
    point_style: none
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
    hidden_fields:
    - user.count
    series_labels:
      embed_user.count: Embed User Count
      standard_users: Standard User Count
    listen: {}
    row: 13
    col: 16
    width: 8
    height: 6
  - title: Dashboards Created
    name: Dashboards Created
    model: i__looker
    explore: dashboard
    type: single_value
    fields:
    - dashboard_count
    - deleted_dashboard_count
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: deleted_dashboard_count
      based_on: dashboard.id
      type: count_distinct
      label: Deleted Dashboard Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: is_null(${dashboard.deleted_date})
    - measure: dashboard_count
      based_on: dashboard.id
      type: count_distinct
      label: Dashboard Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: NOT is_null(${dashboard.deleted_date})
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    query_timezone: America/Los_Angeles
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
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    hidden_fields: []
    comparison_label: Deleted Dashboards
    single_value_title: Dashboards
    y_axes: []
    row: 0
    col: 13
    width: 6
    height: 5
  - title: Look Count
    name: Look Count
    model: i__looker
    explore: look
    type: single_value
    fields:
    - deleted_look_count
    - look_count
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: deleted_look_count
      based_on: look.id
      type: count_distinct
      label: Deleted Look Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: is_null(${look.deleted_date})
    - measure: look_count
      based_on: look.id
      type: count_distinct
      label: Look Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: NOT is_null(${look.deleted_date})
    query_timezone: America/Los_Angeles
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    single_value_title: Looks
    comparison_label: Deleted Looks
    hidden_fields: []
    y_axes: []
    row: 0
    col: 19
    width: 5
    height: 5
  - title: Space Dashboard Tile Count
    name: Space Dashboard Tile Count
    model: i__looker
    explore: dashboard
    type: looker_column
    fields:
    - dashboard_element.count
    - space.id
    - dashboard.count
    filters:
      dashboard.deleted_date: NOT NULL
      dashboard_element.deleted_date: NOT NULL
    sorts:
    - dashboard.count desc
    limit: 25
    column_limit: 50
    dynamic_fields:
    - table_calculation: average_tiles_per_dashboard
      label: Average Tiles Per Dashboard
      expression: "${dashboard_element.count}/${dashboard.count}"
      value_format:
      value_format_name: id
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
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
    hidden_fields:
    - dashboard_element.count
    colors:
    - 'palette: Default'
    series_colors: {}
    x_axis_reversed: false
    y_axis_reversed: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: dashboard.count
        name: Dashboard Count
        axisId: dashboard.count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_tiles_per_dashboard
        name: Average Tiles Per Dashboard
        axisId: average_tiles_per_dashboard
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    point_style: none
    listen: {}
    row: 61
    col: 0
    width: 24
    height: 6
  - title: Dashboard and Look Usage
    name: Dashboard and Look Usage
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - user.count
    - history.query_run_count
    - dashboard_look_id
    filters:
      history.source: Dashboard,Saved Look
    sorts:
    - user.count desc
    limit: 10
    column_limit: 50
    dynamic_fields:
    - dimension: dashboard_look_id
      label: dashboard / look id
      expression: if(NOT is_null(${history.dashboard_id}),concat("Dashboard ",${history.dashboard_id}),concat("Look
        ",${history.look_id}))
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: string
    query_timezone: America/Los_Angeles
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
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
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
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: user.count
        name: User Count
        axisId: user.count
        __FILE: looker_extended/6_usage_and_stats_reporting.dashboard.lookml
        __LINE_NUM: 1680
      __FILE: looker_extended/6_usage_and_stats_reporting.dashboard.lookml
      __LINE_NUM: 1668
    - label: Query Run Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: history.query_run_count
        name: History Query Run Count
        axisId: history.query_run_count
        __FILE: looker_extended/6_usage_and_stats_reporting.dashboard.lookml
        __LINE_NUM: 1695
      __FILE: looker_extended/6_usage_and_stats_reporting.dashboard.lookml
      __LINE_NUM: 1683
    colors:
    - 'palette: Default'
    series_colors: {}
    x_axis_label: Dashboard ID - Look ID
    hidden_fields: []
    point_style: none
    x_axis_reversed: false
    y_axis_reversed: false
    listen:
      History Lookback: history.created_date
    row: 7
    col: 0
    width: 16
    height: 6
  - name: Adoption
    type: text
    title_text: Adoption
    row: 5
    col: 0
    width: 24
    height: 2
  - name: Query Activity
    type: text
    title_text: Query Activity
    row: 19
    col: 0
    width: 24
    height: 2
  - title: Scheduled Jobs Over TIme
    name: Scheduled Jobs Over TIme
    model: i__looker
    explore: scheduled_plan
    type: looker_column
    fields:
    - failed_job_count
    - successful_job_count
    - scheduled_job.created_date
    fill_fields:
    - scheduled_job.created_date
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 2 weeks ago for 2 weeks
    sorts:
    - scheduled_job.created_date desc
    limit: 500
    dynamic_fields:
    - measure: failed_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Failed Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="failure"
    - measure: successful_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Successful Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="success"
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    row: 35
    col: 16
    width: 8
    height: 6
  - title: Failed Schedules
    name: Failed Schedules
    model: i__looker
    explore: scheduled_plan
    type: table
    fields:
    - scheduled_job.created_date
    - scheduled_plan.id
    - content_id
    - scheduled_plan_destination.type
    - scheduled_plan.user_id
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 1 weeks ago for 1 weeks
      scheduled_job.status: failure
    sorts:
    - scheduled_job.created_date desc
    limit: 500
    dynamic_fields:
    - measure: failed_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Failed Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="failure"
    - measure: successful_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Successful Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="success"
    - dimension: content_id
      label: Content ID
      expression: coalesce(${scheduled_plan.dashboard_id},${scheduled_plan.look_id})
      value_format:
      value_format_name:
      _kind_hint: dimension
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
    series_labels:
      scheduled_job.created_date: Scheduled Job Date
      scheduled_plan.id: Scheduled Plan ID
      content_id: Content ID (look or dashboard ID)
      scheduled_plan_destination.type: Scheduled Format
      scheduled_plan.user_id: Scheduled Plan Owner Id
    listen: {}
    row: 35
    col: 8
    width: 8
    height: 6
  - title: Query Error Rates Over Time
    name: Query Error Rates Over Time
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - count_of_erroring_queries
    - count_of_killed_queries
    - history.created_date
    - history.query_run_count
    filters: {}
    sorts:
    - history.created_date desc
    limit: 500
    dynamic_fields:
    - measure: count_of_erroring_queries
      based_on: history.id
      type: count_distinct
      label: Count of Erroring Queries
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.status}="error"
    - measure: count_of_killed_queries
      based_on: history.id
      type: count_distinct
      label: Count of Killed Queries
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.status}="killed"
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    listen:
      History Lookback: history.created_date
    row: 21
    col: 16
    width: 8
    height: 6
  - title: Dashboard Runtime Stats
    name: Dashboard Runtime Stats
    model: i__looker
    explore: dashboard_performance
    type: table
    fields:
    - history.real_dash_id
    - dashboard_performance.count
    - dashboard_history_stats.avg_runtime
    - max_of_max_runtime
    - min_of_min_runtime
    sorts:
    - dashboard_performance.count desc
    limit: 10
    dynamic_fields:
    - measure: median_of_seconds_until_controller_initialized
      based_on: dashboard_page_event_stats.seconds_until_controller_initialized
      expression: ''
      label: Median of Seconds Until Controller Initialized
      type: median
      _kind_hint: measure
      _type_hint: number
    - measure: median_of_seconds_until_dom_content_loaded
      based_on: dashboard_page_event_stats.seconds_until_dom_content_loaded
      expression: ''
      label: Median of Seconds Until Dom Content Loaded
      type: median
      _kind_hint: measure
      _type_hint: number
    - measure: median_of_seconds_until_metadata_loaded
      based_on: dashboard_page_event_stats.seconds_until_metadata_loaded
      expression: ''
      label: Median of Seconds Until Metadata Loaded
      type: median
      _kind_hint: measure
      _type_hint: number
    - measure: max_of_max_runtime
      based_on: dashboard_history_stats.max_runtime
      expression: ''
      label: Max of Max Runtime
      type: max
      _kind_hint: measure
      _type_hint: number
    - measure: min_of_min_runtime
      based_on: dashboard_history_stats.min_runtime
      expression: ''
      label: Min of Min Runtime
      type: min
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      dashboard_history_stats.avg_runtime: Average Runtime (seconds)
      max_of_max_runtime: Max Runtime (seconds)
      min_of_min_runtime: Min Runtime (seconds)
    listen: {}
    row: 27
    col: 16
    width: 8
    height: 6
  - name: merge-qiC8GZ7zUbFSdWD0w4b7VQ-18461
    type: text
    title_text: PDT Build Times
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 47
    col: 0
    width: 8
    height: 6
  - title: Query Performance by Connection
    name: Query Performance by Connection
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - query.model
    - history.connection_name
    - average_of_runtime_in_seconds
    - count_of_queries_against_db
    - history.dialect
    filters:
      history.source: "-SQL Runner,-Other"
    sorts:
    - count_of_queries_against_db desc
    limit: 10
    dynamic_fields:
    - measure: cached_result_query_count
      based_on: history.id
      type: count_distinct
      label: Cached Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "cache"
    - measure: db_result_query_count
      based_on: history.id
      type: count_distinct
      label: DB Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: average_of_runtime_in_seconds
      based_on: history.runtime
      type: average
      label: Average of Runtime in Seconds
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: count_of_queries_against_db
      based_on: history.id
      type: count_distinct
      label: Count of Queries Against DB
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    hidden_fields: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: count_of_queries_against_db
        name: Count of Queries Against DB
        axisId: count_of_queries_against_db
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_of_runtime_in_seconds
        name: Average of Runtime in Seconds
        axisId: average_of_runtime_in_seconds
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    series_labels:
      history.query_run_count: Total Query Run Count
      cache_hit: Cache Hit %
    listen:
      History Lookback: history.created_date
    row: 21
    col: 0
    width: 8
    height: 12
  - title: Query Runs By Source
    name: Query Runs By Source
    model: i__looker
    explore: history
    type: looker_column
    fields:
    - history.source
    - history.query_run_count
    - count_of_queries_against_db
    fill_fields:
    - history.source
    filters: {}
    sorts:
    - history.query_run_count desc
    limit: 10
    dynamic_fields:
    - measure: cached_result_query_count
      based_on: history.id
      type: count_distinct
      label: Cached Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "cache"
    - measure: db_result_query_count
      based_on: history.id
      type: count_distinct
      label: DB Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: average_of_runtime_in_seconds
      based_on: history.runtime
      type: average
      label: Average of Runtime in Seconds
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: count_of_queries_against_db
      based_on: history.id
      type: count_distinct
      label: Count of Queries Against DB
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    hidden_fields: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: count_of_queries_against_db
        name: Count of Queries Against DB
        axisId: count_of_queries_against_db
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_of_runtime_in_seconds
        name: Average of Runtime in Seconds
        axisId: average_of_runtime_in_seconds
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    series_labels:
      history.query_run_count: Total Query Run Count
      cache_hit: Cache Hit %
    listen:
      History Lookback: history.created_date
    row: 13
    col: 0
    width: 8
    height: 6
  - title: Scheduled Jobs By Format
    name: Scheduled Jobs By Format
    model: i__looker
    explore: scheduled_plan
    type: looker_column
    fields:
    - successful_job_count
    - scheduled_plan_destination.format
    - scheduled_job.created_week
    pivots:
    - scheduled_plan_destination.format
    fill_fields:
    - scheduled_job.created_week
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 4 weeks ago for 4 weeks
    sorts:
    - scheduled_job.created_week
    - scheduled_plan_destination.format 0
    limit: 500
    dynamic_fields:
    - measure: failed_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Failed Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="failure"
    - measure: successful_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Successful Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="success"
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    listen: {}
    row: 41
    col: 16
    width: 8
    height: 6
  - title: Period over Period Queries
    name: Period over Period Queries
    model: i__looker
    explore: history
    type: single_value
    fields:
    - queries_last_7_days
    - queries_last_7_14_days
    filters:
      history.created_date: 14 days
    limit: 500
    dynamic_fields:
    - measure: queries_last_7_days
      based_on: history.id
      type: count_distinct
      label: Queries Last 7 Days
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: matches_filter(${history.created_date}, `7 days`)
    - measure: queries_last_7_14_days
      based_on: history.id
      type: count_distinct
      label: Queries Last 7-14 Days
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: NOT matches_filter(${history.created_date}, `7 days`) AND
        matches_filter(${history.created_date}, `14 days`)
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    single_value_title: Queries Last 7 Days
    comparison_label: Queries Previous 7 Days
    row: 0
    col: 0
    width: 7
    height: 5
  - title: Users Period over Period
    name: Users Period over Period
    model: i__looker
    explore: history
    type: single_value
    fields:
    - users_last_7_days
    - users_previous_7_days
    filters:
      history.created_date: 14 days
    limit: 500
    dynamic_fields:
    - measure: users_last_7_days
      based_on: user.id
      type: count_distinct
      label: Users Last 7 Days
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: matches_filter(${history.created_date}, `7 days`)
    - measure: users_previous_7_days
      based_on: user.id
      type: count_distinct
      label: Users Previous 7 Days
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: NOT matches_filter(${history.created_date}, `7 days`) AND
        matches_filter(${history.created_date}, `14 days`)
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    single_value_title: Users Last 7 Days
    comparison_label: Users Previous 7 Days
    row: 0
    col: 7
    width: 6
    height: 5
  - title: Most Frequent Queries
    name: Most Frequent Queries
    model: i__looker
    explore: history
    type: table
    fields:
    - query.id
    - query.link
    - query.model
    - query.view
    - average_of_runtime_in_seconds
    - count_of_queries_against_db
    filters:
      history.source: "-SQL Runner,-Other"
    sorts:
    - count_of_queries_against_db desc
    limit: 20
    column_limit: 50
    dynamic_fields:
    - measure: cached_result_query_count
      based_on: history.id
      type: count_distinct
      label: Cached Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "cache"
    - measure: db_result_query_count
      based_on: history.id
      type: count_distinct
      label: DB Result Query Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: average_of_runtime_in_seconds
      based_on: history.runtime
      type: average
      label: Average of Runtime in Seconds
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    - measure: count_of_queries_against_db
      based_on: history.id
      type: count_distinct
      label: Count of Queries Against DB
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${history.result_source} = "query"
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
    hidden_fields: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: count_of_queries_against_db
        name: Count of Queries Against DB
        axisId: count_of_queries_against_db
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_of_runtime_in_seconds
        name: Average of Runtime in Seconds
        axisId: average_of_runtime_in_seconds
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    series_labels:
      history.query_run_count: Total Query Run Count
      cache_hit: Cache Hit %
    conditional_formatting:
    - type: greater than
      value: 4
      background_color: "#fc6958"
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - average_of_runtime_in_seconds
    listen:
      History Lookback: history.created_date
    row: 27
    col: 8
    width: 8
    height: 6
  - name: merge-6x6QDRhYLiyYBwpkLbCHg9-18507
    type: text
    title_text: Users without activity over last 14 days
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 55
    col: 0
    width: 8
    height: 6
  - name: merge-CUSgEIj3MOZOW05oAqQfzX-18521
    type: text
    title_text: Unused Looks (Last 90 days)
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 55
    col: 16
    width: 8
    height: 6
  - title: Scheduled Jobs Hourly Distribution
    name: Scheduled Jobs Hourly Distribution
    model: i__looker
    explore: scheduled_plan
    type: looker_column
    fields:
    - scheduled_job.count
    - scheduled_job.created_hour_of_day
    fill_fields:
    - scheduled_job.created_hour_of_day
    filters:
      scheduled_plan.run_once: 'no'
      scheduled_job.created_date: 2 weeks ago for 2 weeks
    sorts:
    - scheduled_job.created_hour_of_day
    limit: 500
    dynamic_fields:
    - measure: failed_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Failed Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="failure"
    - measure: successful_job_count
      based_on: scheduled_job.id
      type: count_distinct
      label: Successful Job Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${scheduled_job.status}="success"
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    row: 47
    col: 16
    width: 8
    height: 6
  - title: PDT Build Time Series
    name: PDT Build Time Series
    model: i__looker
    explore: pdt_log
    type: looker_column
    fields:
    - successful_pdt_build_count
    - pdt_log.connection
    - pdt_log.occur_hour_of_day
    pivots:
    - pdt_log.connection
    fill_fields:
    - pdt_log.occur_hour_of_day
    filters:
      pdt_log.occur_date: 14 days
    sorts:
    - successful_pdt_build_count desc 0
    - pdt_log.connection
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: pdt_trigger_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Trigger Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "trigger value error"
    - measure: pdt_create_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Create Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create cancelled error"
    - measure: successful_pdt_build_count
      based_on: pdt_log.id
      type: count_distinct
      label: Successful PDT Build Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create complete"
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    conditional_formatting:
    - type: greater than
      value: 0
      background_color:
      font_color: "#fc5858"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    - type: greater than
      value: 0
      background_color:
      font_color: "#417c0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - successful_pdt_build_count
    y_axes:
    - label: Build Count
      orientation: left
      series:
      - id: pdt_create_failures
        name: PDT Create Failures
        axisId: pdt_create_failures
      - id: successful_pdt_build_count
        name: Successful PDT Build Count
        axisId: successful_pdt_build_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    row: 41
    col: 0
    width: 8
    height: 6
  - title: Top PDT Builds by View
    name: Top PDT Builds by View
    model: i__looker
    explore: pdt_log
    type: table
    fields:
    - successful_pdt_build_count
    - pdt_log.connection
    - pdt_log.view_name
    - pdt_log.model_name
    filters:
      pdt_log.occur_date: 14 days
    sorts:
    - successful_pdt_build_count desc
    - pdt_log.connection
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: pdt_trigger_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Trigger Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "trigger value error"
    - measure: pdt_create_failures
      based_on: pdt_log.id
      type: count_distinct
      label: PDT Create Failures
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create cancelled error"
    - measure: successful_pdt_build_count
      based_on: pdt_log.id
      type: count_distinct
      label: Successful PDT Build Count
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
      filter_expression: ${pdt_log.action} = "create complete"
    query_timezone: America/New_York
    show_view_names: false
    show_row_numbers: false
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    conditional_formatting:
    - type: greater than
      value: 0
      background_color:
      font_color: "#fc5858"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields: []
    - type: greater than
      value: 0
      background_color:
      font_color: "#417c0f"
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - successful_pdt_build_count
    y_axes:
    - label: Build Count
      orientation: left
      series:
      - id: pdt_create_failures
        name: PDT Create Failures
        axisId: pdt_create_failures
      - id: successful_pdt_build_count
        name: Successful PDT Build Count
        axisId: successful_pdt_build_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    row: 41
    col: 8
    width: 8
    height: 6
  - name: merge-aRK2gqxZd5em8NYcuE9XmV-18525
    type: text
    title_text: Project Size
    subtitle_text: This item contains data that can no longer be displayed.
    body_text: This item contains results merged from two or more queries. This is
      currently not supported in LookML dashboards.
    row: 55
    col: 8
    width: 8
    height: 6
  - name: PDT and Scheduler Activity
    type: text
    title_text: PDT and Scheduler Activity
    row: 33
    col: 0
    width: 24
    height: 2
  - name: Instance Management
    type: text
    title_text: Instance Management
    row: 53
    col: 0
    width: 24
    height: 2
  filters:
  - name: History Lookback
    title: History Lookback
    type: date_filter
    default_value: 14 days
    allow_multiple_values: true
    required: false
