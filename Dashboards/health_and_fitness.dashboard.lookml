- dashboard: health_and_fitness
  title: Health and Fitness
  layout: newspaper
  elements:
  - title: Active Minutes
    name: Active Minutes
    model: thelook_shiggins
    explore: order_items
    type: single_value
    fields: [users.average_age]
    limit: 500
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: '80', value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    custom_color: "#8BC34A"
    show_single_value_title: false
    single_value_title: ''
    value_format: "#"
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Active Minutes Goal
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 7
    height: 2
  - title: Heartrate
    name: Heartrate
    model: thelook_shiggins
    explore: order_items
    type: looker_column
    fields: [order_items.average_spend_per_user, order_items.created_hour_of_day]
    fill_fields: [order_items.created_hour_of_day]
    sorts: [order_items.created_hour_of_day]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: Heartrate, orientation: left, series: [{axisId: order_items.average_spend_per_user,
            id: order_items.average_spend_per_user, name: Average Spend per User}],
        showLabels: true, showValues: true, valueFormat: "#", unpinAxis: true, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Hour
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order_items.average_spend_per_user: "#04b5cc"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    reference_lines: [{reference_type: line, line_value: mean, range_start: max, range_end: min,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: "#000000", value_format: '#.# "avg BPM"'}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: ''
    value_format: '# "BPM"'
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    row: 0
    col: 7
    width: 8
    height: 6
