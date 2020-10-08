- dashboard: dynamic_dashboard_control_with_filters
  title: Dynamic Dashboard Control (With Filters)
  layout: newspaper
  elements:
  - title: Total Gross Margin
    name: Total Gross Margin
    model: thelook_shiggins_dev
    explore: order_items
    type: single_value
    fields: [order_items.total_gross_margin, order_items.previous_period]
    sorts: [order_items.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: versus_previous, label: versus previous,
        expression: "${order_items.total_gross_margin} / offset(${order_items.total_gross_margin},1)-1",
        value_format: !!null '', value_format_name: percent_2, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 6
    col: 0
    width: 5
    height: 6
  - title: Products Count
    name: Products Count
    model: thelook_shiggins_dev
    explore: order_items
    type: single_value
    fields: [products.count, order_items.previous_period]
    sorts: [order_items.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: versus_previous, label: versus previous,
        expression: "${products.count} / offset(${products.count},1)-1", value_format: !!null '',
        value_format_name: percent_2, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 18
    col: 0
    width: 5
    height: 6
  - title: Active Users
    name: Active Users
    model: thelook_shiggins_dev
    explore: order_items
    type: single_value
    fields: [order_items.previous_period, users.count]
    sorts: [order_items.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: versus_previous, label: versus previous,
        expression: "${users.count} / offset(${users.count},1)-1", value_format: !!null '',
        value_format_name: percent_2, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    series_types: {}
    defaults_version: 1
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 12
    col: 0
    width: 5
    height: 6
  - title: Products Count 2
    name: Products Count 2
    model: thelook_shiggins_dev
    explore: order_items
    type: looker_grid
    fields: [products.category, products.count, products.brand_count, order_items.count,
      order_items.returned_count, order_items.average_shipping_time, order_items.return_rate,
      order_items.total_sale_price, order_items.total_gross_margin, order_items.average_sale_price,
      order_items.average_gross_margin]
    sorts: [products.count desc]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: true
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    series_cell_visualizations:
      products.count:
        is_active: false
      order_items.total_gross_margin:
        is_active: true
      order_items.total_sale_price:
        is_active: true
      order_items.median_sale_price:
        is_active: true
      order_items.average_sale_price:
        is_active: true
      order_items.average_gross_margin:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    listen:
      Date: order_items.created_date
      State: users.state
    row: 18
    col: 5
    width: 19
    height: 6
  - title: Total Sale Price
    name: Total Sale Price
    model: thelook_shiggins_dev
    explore: order_items
    type: single_value
    fields: [order_items.total_sale_price, order_items.previous_period]
    sorts: [order_items.previous_period desc]
    limit: 500
    dynamic_fields: [{table_calculation: versus_previous, label: versus previous,
        expression: "${order_items.total_sale_price} / offset(${order_items.total_sale_price},1)-1",
        value_format: !!null '', value_format_name: percent_2, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: ''
    value_format: ''
    series_types: {}
    defaults_version: 1
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 0
    col: 0
    width: 5
    height: 6
  - title: Active Users 2
    name: Active Users 2
    model: thelook_shiggins_dev
    explore: order_items
    type: looker_column
    fields: [users.count, order_items.created_date, order_items.first_purchase_count]
    fill_fields: [order_items.created_date]
    filters:
      order_items.previous_period_filter: 90 days ago for 90 days
    sorts: [order_items.created_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: repeat_purchase, label: Repeat Purchase,
        expression: "${users.count} - ${order_items.first_purchase_count}", value_format: !!null '',
        value_format_name: decimal_0, is_disabled: false, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 9d1da669-a6b4-4a4f-8519-3ea8723b79b5
      palette_id: 0c5264fb-0681-4817-b9a5-d3c81002ce4c
      options:
        steps: 5
        reverse: true
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    hide_legend: false
    legend_position: right
    series_types: {}
    point_style: none
    series_colors:
      order_items.first_purchase_count: "#149888"
    series_labels:
      order_items.first_purchase_count: First Purchase
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#AE6262"
    totals_rotation: -90
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [users.count]
    listen:
      Date: order_items.created_date
      State: users.state
    row: 12
    col: 11
    width: 13
    height: 6
  - title: Active Users 3
    name: Active Users 3
    model: thelook_shiggins_dev
    explore: order_items
    type: looker_donut_multiples
    fields: [first_purchase, users.gender, users.count]
    pivots: [users.gender]
    sorts: [first_purchase, users.gender]
    limit: 500
    column_limit: 50
    dynamic_fields: [{dimension: first_purchase, label: First Purchase, expression: 'if(${order_facts.is_first_purchase},"First","Repeat")',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
    query_timezone: America/Los_Angeles
    show_value_labels: false
    font_size: '12'
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    hide_legend: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      order_items.first_purchase_count: "#149888"
      Female - users.count: "#FFB690"
      Male - users.count: "#8643B1"
    series_labels:
      order_items.first_purchase_count: First Purchase
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#AE6262"
    totals_rotation: -90
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    defaults_version: 1
    listen:
      Date: order_items.created_date
      State: users.state
    row: 12
    col: 5
    width: 6
    height: 6
  - title: Total Sale Price 2
    name: Total Sale Price 2
    model: thelook_shiggins_dev
    explore: order_items
    type: looker_line
    fields: [order_items.total_sale_price, order_items.previous_period, order_items.day_in_period]
    pivots: [order_items.previous_period]
    sorts: [order_items.previous_period 0, order_items.day_in_period]
    limit: 500
    dynamic_fields: [{table_calculation: over_previous_day_this_period, label: Over
          Previous Day (This Period), expression: "    pivot_index(${order_items.total_sale_price},2)\
          \ / offset(pivot_index(${order_items.total_sale_price},2),1)-1", value_format: !!null '',
        value_format_name: percent_2, is_disabled: false, _kind_hint: supermeasure,
        _type_hint: number}, {table_calculation: over_previous_period, label: Over
          Previous Period, expression: 'pivot_index(${order_items.total_sale_price},2)
          / pivot_index(${order_items.total_sale_price},1) -1', value_format: !!null '',
        value_format_name: percent_2, _kind_hint: supermeasure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    color_application:
      collection_id: 5f313589-67ce-44ba-b084-ec5107a7bb7e
      palette_id: be92eae7-de25-46ae-8e4f-21cb0b69a1f3
      options:
        steps: 5
        reverse: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: order_items.total_sale_price,
            id: Previous Period - order_items.total_sale_price, name: Previous Period
              - Order Items Total Sale Price}, {axisId: order_items.total_sale_price,
            id: This Period - order_items.total_sale_price, name: This Period - Order
              Items Total Sale Price}], showLabels: true, showValues: true, minValue: !!null '',
        unpinAxis: false, tickDensity: custom, tickDensityCustom: 5, type: linear},
      {label: !!null '', orientation: right, series: [{axisId: over_previous_period,
            id: over_previous_period, name: Over Previous Period}, {axisId: over_previous_day_this_period,
            id: over_previous_day_this_period, name: Over Previous Day (This Period)}],
        showLabels: true, showValues: true, maxValue: 1, minValue: !!null '', unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: left
    series_types:
      over_previous_period: area
      over_previous_day_this_period: area
    point_style: none
    series_colors:
      over_previous_day_this_period: "#FFB690"
      This Period - order_items.total_sale_price: "#EE9093"
    series_labels:
      Previous Period - order_items.total_sale_price: Total Sale Price (This Period)
      This Period - order_items.total_sale_price: Total Sale Price (Previous Period)
    series_point_styles:
      over_previous_day_this_period: auto
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 0
    col: 5
    width: 19
    height: 6
  - title: Total Gross Margin 2
    name: Total Gross Margin 2
    model: thelook_shiggins_dev
    explore: order_items
    type: looker_column
    fields: [order_items.total_gross_margin, order_items.created_date, order_items.is_returned,
      order_items.total_sale_price, order_items.total_gross_margin_percentage]
    pivots: [order_items.is_returned]
    fill_fields: [order_items.is_returned]
    filters:
      order_items.created_date: 30 days
      order_items.status: ''
    sorts: [order_items.created_date, order_items.is_returned]
    limit: 500
    dynamic_fields: [{table_calculation: total_gross_margin, label: Total Gross Margin,
        expression: 'if(pivot_column()=1,${order_items.total_gross_margin},${order_items.total_sale_price}*-1)',
        value_format: !!null '', value_format_name: usd_0, _kind_hint: measure, _type_hint: number},
      {table_calculation: gross_margin_percentage, label: Gross Margin Percentage,
        expression: 'pivot_index(${order_items.total_gross_margin_percentage},1)',
        value_format: !!null '', value_format_name: percent_1, _kind_hint: supermeasure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: left
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: left, series: [{axisId: No - total_gross_margin,
            id: No - total_gross_margin, name: Total Gross Margin}, {axisId: Yes -
              total_gross_margin, id: Yes - total_gross_margin, name: Returned Amount}],
        showLabels: true, showValues: true, maxValue: !!null '', minValue: !!null '',
        unpinAxis: false, tickDensity: default, tickDensityCustom: 6, type: linear},
      {label: '', orientation: right, series: [{axisId: gross_margin_percentage, id: gross_margin_percentage,
            name: Gross Margin Percentage}], showLabels: false, showValues: true,
        maxValue: 0.6, minValue: 0.4, valueFormat: 0%, unpinAxis: true, tickDensity: custom,
        tickDensityCustom: 11, type: linear}]
    series_types:
      gross_margin_percentage: line
    series_colors:
      No - total_gross_margin: "#068993"
      Yes - total_gross_margin: "#F15922"
    series_labels:
      Previous Period - order_items.total_gross_margin: Total Gross Margin (This Period)
      This Period - order_items.total_gross_margin: Total Gross Margin (Previous Period)
      No - total_gross_margin: Total Gross Margin
      Yes - total_gross_margin: Returned Amount
    series_point_styles:
      over_previous_day_this_period: auto
    show_null_points: false
    interpolation: linear
    discontinuous_nulls: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields: [order_items.total_gross_margin, order_items.total_sale_price,
      order_items.total_gross_margin_percentage]
    defaults_version: 1
    listen:
      Date: order_items.previous_period_filter
      State: users.state
    row: 6
    col: 5
    width: 19
    height: 6
  filters:

  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: thelook_shiggins_dev
    explore: order_items
    listens_to_filters: []
    field: users.state
  - name: KPIs
    title: KPIs
    type: string_filter
    default_value: ''
    allow_multiple_values: true
    required: false
