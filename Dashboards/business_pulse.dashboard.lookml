- dashboard: business_pulse

  title: Business_Pulse_Title
  layout: static

  description: ''
  embed_style:
    background_color: white
    show_title: false
    title_color: "#0f0201"
    show_filters_bar: false
    tile_text_color: "#3a4245"
    text_tile_text_color: "#ecf1e8"
  elements:
  - title: Number of First Purchasers
    name: Number of First Purchasers
    model: thelook_shiggins
    explore: order_items
    type: single_value
    fields: [order_items.first_purchase_count]
    sorts: [order_items.first_purchase_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: goal, label: Goal, expression: '10000', value_format: !!null '',
        value_format_name: decimal_0}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: New Users Acquired
    show_comparison: false
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    font_size: medium
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    text_color: black
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 0
    col: 0
    width: 1
    height: 1
  - title: Average Order Sale Price
    name: "@{averate_tat_san_fran_general}"
    model: thelook_shiggins
    explore: order_items
    type: single_value
    fields: [order_items.average_sale_price, order_items.average_gross_margin]
    sorts: [orders.average_profit desc, order_items.average_sale_price desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: date, label: date, expression: now(), value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, _type_hint: date}, {
        table_calculation: marginrevenue_ratio, label: Margin/Revenue Ratio, expression: "${order_items.average_gross_margin}/${order_items.average_sale_price}-1",
        value_format: !!null '', value_format_name: decimal_2, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Avg Order Value
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    query_timezone: America/Los_Angeles
    show_view_names: true
    font_size: medium
    text_color: black
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    series_types: {}
    hidden_fields: [order_items.average_gross_margin]
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 0
    col: 12
    width: 1
    height: 1
  - title: Orders by Day and Category
    name: Orders by Day and Category
    model: thelook_shiggins
    explore: order_items
    type: looker_area
    fields: [products.category, order_items.count, order_items.created_date]
    pivots: [products.category]
    fill_fields: [order_items.created_date]
    filters:
      products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
        Sweatshirts,Accessories
    sorts: [products.category, order_items.created_date desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    y_axis_labels: ["# Order Items"]
    stacking: normal
    x_axis_datetime: true
    hide_points: true
    hide_legend: false
    x_axis_datetime_tick_count: 4
    show_x_axis_label: false
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_points: true
    point_style: none
    interpolation: linear
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories,
            name: Accessories, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 195}, {id: Blazers & Jackets, name: Blazers &amp; Jackets,
            axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 198}, {id: Fashion Hoodies & Sweatshirts, name: Fashion Hoodies
              &amp; Sweatshirts, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 201}, {id: Pants, name: Pants, axisId: order_items.count,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 204},
          {id: Shorts, name: Shorts, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 207}, {id: Sweaters, name: Sweaters, axisId: order_items.count,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 210}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear, __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 192}]
    x_axis_reversed: false
    y_axis_reversed: false
    note_state: collapsed
    note_display: hover
    note_text: ''
    listen: {}
    row: 36
    col: 0
    width: 1
    height: 1
  - title: Website Visit Volume vs Conversion Rate
    name: Website Visit Volume vs Conversion Rate
    model: thelook_shiggins
    explore: events
    type: looker_column
    fields: [events.event_day_of_week, events.sessions_count, events.unique_visitors,
      sessions.overall_conversion]
    sorts: [events.event_day_of_week]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    colors: ["#1EA8DF", "#8ED3EF", "#B1A8C4", "#635189"]
    y_axis_orientation: [left, right]
    label_color: ["#EA8A2F", "#e9b404"]
    ordering: none
    show_null_labels: false
    show_null_points: true
    point_style: circle_outline
    interpolation: linear
    series_types:
      events.count: line
      events.unique_visitors: line
      events.sessions_count: line
    series_labels:
      sessions.overall_conversion: Conversion Rate
      events.sessions_count: Total Visitors
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_colors: {}
    y_axes: [{label: '', maxValue: !!null '', minValue: !!null '', orientation: left,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: events.unique_visitors,
            name: Unique Visitors, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 304}, {id: events.sessions_count, name: Sessions Count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 306}], __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
        __LINE_NUM: 292}, {label: '', maxValue: !!null '', minValue: !!null '', orientation: right,
        showLabels: true, showValues: true, tickDensity: default, tickDensityCustom: 5,
        type: linear, unpinAxis: false, valueFormat: !!null '', series: [{id: sessions.overall_conversion,
            name: Conversion Rate, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 320}], __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
        __LINE_NUM: 308}]
    hidden_fields: []
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 28
    col: 0
    width: 1
    height: 1
  - title: Percent of Cohort Still Active by Traffic Source
    name: Percent of Cohort Still Active by Traffic Source
    model: thelook_shiggins
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.count, users.traffic_source]
    pivots: [users.traffic_source]
    filters:
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.age_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: pct_cohort_still_active, label: Pct Cohort
          Still Active, expression: "${users.count} / max(${users.count})", value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_points: false
    point_style: none
    interpolation: linear
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    hidden_fields: [cumulative_lifetime_spend, order_items.total_sale_price, users.count]
    y_axis_labels: [Percent of Cohort still Active]
    y_axis_max: ['50']
    limit_displayed_rows: true
    y_axis_scale_mode: linear
    series_colors: {}
    y_axis_value_format: "#\\%"
    y_axes: []
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: '1'
    x_axis_reversed: false
    y_axis_reversed: false
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 13
    col: 12
    width: 1
    height: 1
  - title: Total Spend by Cohort
    name: Total Spend by Cohort
    model: thelook_shiggins
    explore: order_items
    type: looker_line
    fields: [order_items.months_since_signup, users.created_month, order_items.total_sale_price]
    pivots: [users.created_month]
    filters:
      order_items.created_month: 12 months ago for 12 months
      order_items.months_since_signup: "[0, 12]"
      users.created_month: 12 months
    sorts: [order_items.months_since_signup, users.created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: total_sale_price, label: Total Sale Price,
        expression: "if(\nis_null(${order_items.total_sale_price})\n,null\n,running_total(${order_items.total_sale_price}))",
        value_format: "$#,###"}]
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    show_null_points: false
    point_style: none
    colors: ["#7FCDAE", "#7ED09C", "#7DD389", "#85D67C", "#9AD97B", "#B1DB7A", "#CADF79",
      "#E2DF78", "#E5C877", "#E7AF75", "#EB9474", "#EE7772"]
    hidden_fields: [cumulative_lifetime_spend, order_items.total_sale_price]
    y_axis_value_format: "$#,##0"
    interpolation: linear
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    y_axes: [{label: '', orientation: left, series: [{id: 2018-07, name: 2018-07,
            axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 489}, {id: 2018-06, name: 2018-06, axisId: total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 492},
          {id: 2018-05, name: 2018-05, axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 495}, {id: 2018-04, name: 2018-04, axisId: total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 498},
          {id: 2018-03, name: 2018-03, axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 501}, {id: 2018-02, name: 2018-02, axisId: total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 504},
          {id: 2018-01, name: 2018-01, axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 507}, {id: 2017-12, name: 2017-12, axisId: total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 510},
          {id: 2017-11, name: 2017-11, axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 513}, {id: 2017-10, name: 2017-10, axisId: total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 516},
          {id: 2017-09, name: 2017-09, axisId: total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 519}], showLabels: true, showValues: true, valueFormat: "$0,\\\
          K\\", unpinAxis: false, tickDensity: default, type: linear, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
        __LINE_NUM: 486}]
    x_axis_reversed: false
    y_axis_reversed: false
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 28
    col: 12
    width: 1
    height: 1
  - title: Total Sales, Year over Year
    name: Total Sales, Year over Year
    model: thelook_shiggins
    explore: order_items
    type: looker_line
    fields: [order_items.created_year, order_items.created_month_num, order_items.total_sale_price]
    pivots: [order_items.created_year]
    filters:
      order_items.created_date: before 0 months ago
      order_items.created_year: 4 years
    sorts: [order_items.created_year desc, order_items.created_month_num]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: right
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
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
    show_null_points: false
    point_style: none
    interpolation: monotone
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [calculation_1]
    x_axis_label: Month of Year
    colors: ["#635189", "#B1A8C4", "#1EA8DF", "#8ED3EF"]
    y_axis_value_format: "$#,##0"
    series_types: {}
    y_axes: [{label: '', orientation: left, series: [{id: '2018', name: '2018', axisId: order_items.total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 596},
          {id: '2017', name: '2017', axisId: order_items.total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 599}, {id: '2016', name: '2016', axisId: order_items.total_sale_price,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 602},
          {id: '2015', name: '2015', axisId: order_items.total_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 605}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear, valueFormat: "$0,\\K\\", __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
        __LINE_NUM: 593}]
    x_axis_reversed: false
    y_axis_reversed: false
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 4
    col: 0
    width: 1
    height: 1
  - title: Highest Spending Users
    name: Highest Spending Users
    model: thelook_shiggins
    explore: order_items
    type: looker_map
    fields: [users.approx_location, users.gender, order_items.order_count, users.count,
      order_items.total_sale_price, order_items.average_spend_per_user, users.country]
    pivots: [users.gender]
    filters:
      users.country: USA
    sorts: [users.gender 0, order_items.total_sale_price desc 0]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
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
    ordering: none
    show_null_labels: false
    loading: false
    hidden_fields: [orders.count, users.count, order_items.total_sale_price, order_items.order_count]
    map_plot_mode: points
    heatmap_gridlines: true
    map_tile_provider: positron
    map_position: fit_data
    map_scale_indicator: 'off'
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: pixels
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_legend: true
    quantize_map_value_colors: false
    map: usa
    map_projection: ''
    quantize_colors: false
    colors: [whitesmoke, "#64518A"]
    outer_border_color: "#64518A"
    inner_border_color: ''
    inner_border_width: 1.6
    outer_border_width: 1
    empty_color: ''
    map_pannable: true
    map_zoomable: true
    map_latitude: 38.20365531807149
    map_longitude: -99.931640625
    map_zoom: 3
    map_value_scale_clamp_max: 200
    map_value_scale_clamp_min: 0
    map_value_colors: [white, purple]
    map_marker_radius_max: 15
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_marker_color: ["#64518A", "#1ea8df", "#a2dcf3#57BEBE", "#7F7977", "#B2A898",
      "#494C52"]
    heatmap_gridlines_empty: false
    reverse_map_value_colors: false
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: Bubble size corresponds to average user spend
    listen: {}
    row: 4
    col: 12
    width: 1
    height: 1
  - title: User Behaviors by Traffic Source
    name: User Behaviors by Traffic Source
    model: thelook_shiggins
    explore: order_items
    type: looker_column
    fields: [users.traffic_source, order_items.average_sale_price, user_order_facts.average_lifetime_orders]
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axis_combined: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    ordering: none
    show_null_labels: false
    hidden_fields: [percent_repeat_customers]
    value_labels: legend
    label_type: labPer
    font_size: '13'
    colors: ["#1ea8df", "#a2dcf3", "#929292", "#9fdee0", "#1f3e5a", "#90c8ae", "#92818d",
      "#c5c6a6", "#82c2ca", "#cee0a0", "#928fb4", "#9fc190"]
    hide_legend: false
    y_axis_orientation: [left, right]
    y_axis_value_format: '0'
    y_axis_labels: [Average Sale Price ($)]
    show_null_points: true
    point_style: circle_outline
    interpolation: linear
    limit_displayed_rows: false
    y_axis_scale_mode: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{id: order_items.average_sale_price,
            name: Average Sale Price, axisId: order_items.average_sale_price, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
            __LINE_NUM: 798}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
        __LINE_NUM: 795}, {label: !!null '', orientation: right, series: [{id: user_order_facts.average_lifetime_orders,
            name: Average Lifetime Orders, axisId: user_order_facts.average_lifetime_orders,
            __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 809}],
        showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        type: linear, __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 806}]
    x_axis_reversed: false
    y_axis_reversed: false
    listen: {}
    row: 13
    col: 0
    width: 1
    height: 1
  - title: User Basic Demographic Profile
    name: User Basic Demographic Profile
    model: thelook_shiggins
    explore: order_items
    type: looker_donut_multiples
    fields: [users.gender, users.traffic_source, order_items.count]
    pivots: [users.traffic_source]
    filters:
      users.gender: "-NULL"
    sorts: [user_order_facts.lifetime_orders_tier__sort_, users.traffic_source, order_items.count
        desc 0]
    limit: 500
    column_limit: 15
    query_timezone: America/Los_Angeles
    show_value_labels: true
    show_view_names: true
    font_size: 15
    stacking: ''
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
    ordering: none
    show_null_labels: false
    hide_legend: false
    colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
      "#B2A898", "#494C52"]
    series_colors: {}
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: below
    note_text: ''
    listen: {}
    row: 20
    col: 0
    width: 1
    height: 1
  - title: Most Viewed Brands Online
    name: Most Viewed Brands Online
    model: thelook_shiggins
    explore: sessions
    type: table
    fields: [product_viewed.brand, sessions.count, sessions.cart_to_checkout_conversion]
    filters:
      product_viewed.brand: "-NULL"
    sorts: [sessions.count desc]
    limit: 15
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
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
    ordering: none
    show_null_labels: false
    show_row_numbers: true
    truncate_column_names: true
    table_theme: gray
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
    limit_displayed_rows: false
    hide_totals: false
    hide_row_totals: false
    enable_conditional_formatting: false
    conditional_formatting_ignored_fields: []
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_labels:
      sessions.cart_to_checkout_conversion: Cart Conversion
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: above
    note_text: ''
    listen: {}
    row: 20
    col: 12
    width: 1
    height: 1
  - title: 30 Day Repeat Purchase Rate
    name: 30 Day Repeat Purchase Rate
    model: thelook_shiggins
    explore: order_items
    type: single_value
    fields: [order_items.return_rate, order_items.30_day_repeat_purchase_rate]
    sorts: [repeat_purchase_facts.30_day_repeat_purchase_rate desc, order_items.30_day_repeat_purchase_rate
        desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Return Rate
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: Repeart Purchase Rate
    query_timezone: America/Los_Angeles
    font_size: medium
    text_color: black
    colors: ["#1f78b4", "#a6cee3", "#33a02c", "#b2df8a", "#e31a1c", "#fb9a99", "#ff7f00",
      "#fdbf6f", "#6a3d9a", "#cab2d6", "#b15928", "#edbc0e"]
    hidden_fields: []
    y_axes: []
    note_state: collapsed
    note_display: hover
    note_text: What percent of orders are followed by a repeat purchase by the same
      user within 30 days?
    listen: {}
    row: 0
    col: 6
    width: 1
    height: 1
  - title: Total Order Count
    name: Total Order Count
    model: thelook_shiggins
    explore: order_items
    type: single_value
    fields: [order_items.reporting_period, order_items.count]
    filters:
      order_items.reporting_period: "-NULL"
    sorts: [order_items.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: percent_change, label: Percent Change, expression: "${order_items.count}/offset(${order_items.count},1)\
          \ - 1", value_format: !!null '', value_format_name: percent_0}]
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    single_value_title: Orders This Year
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: vs Same Period Last Year
    query_timezone: America/Los_Angeles
    colors: ["#5245ed", "#a2dcf3", "#776fdf", "#1ea8df", "#49cec1", "#776fdf", "#49cec1",
      "#1ea8df", "#a2dcf3", "#776fdf", "#776fdf", "#635189"]
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
    hidden_fields: [order_items.reporting_period]
    y_axes: []
    listen: {}
    row: 0
    col: 18
    width: 1
    height: 1
  # - title: Orders by Day and Category 1
  #   name: Orders by Day and Category 1
  #   model: thelook_shiggins
  #   explore: order_items
  #   type: looker_grid
  #   fields: [products.category, order_items.created_date, order_items.count]
  #   filters:
  #     products.category: Blazers & Jackets,Sweaters,Pants,Shorts,Fashion Hoodies &
  #       Sweatshirts,Accessories
  #     order_items.created_date: 7 days
  #   sorts: [products.category, order_items.created_date desc]
  #   limit: 500
  #   column_limit: 50
  #   row_total: right
  #   query_timezone: America/Los_Angeles
  #   colors: ["#64518A", "#8D7FB9", "#EA8A2F", "#F2B431", "#2DA5DE", "#57BEBE", "#7F7977",
  #     "#B2A898", "#494C52"]
  #   y_axis_labels: ["# Order Items"]
  #   stacking: normal
  #   x_axis_datetime: true
  #   hide_points: true
  #   hide_legend: false
  #   x_axis_datetime_tick_count: 4
  #   show_x_axis_label: false
  #   show_value_labels: false
  #   label_density: 25
  #   legend_position: center
  #   x_axis_gridlines: false
  #   y_axis_gridlines: true
  #   show_view_names: true
  #   y_axis_combined: true
  #   show_y_axis_labels: true
  #   show_y_axis_ticks: true
  #   y_axis_tick_density: default
  #   y_axis_tick_density_custom: 5
  #   show_x_axis_ticks: true
  #   x_axis_scale: auto
  #   show_null_points: true
  #   point_style: none
  #   interpolation: linear
  #   limit_displayed_rows: false
  #   y_axis_scale_mode: linear
  #   show_totals_labels: false
  #   show_silhouette: false
  #   totals_color: "#808080"
  #   hidden_fields: []
  #   y_axes: [{label: Number of Orders, orientation: left, series: [{id: Accessories,
  #           name: Accessories, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
  #           __LINE_NUM: 195}, {id: Blazers & Jackets, name: Blazers &amp; Jackets,
  #           axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
  #           __LINE_NUM: 198}, {id: Fashion Hoodies & Sweatshirts, name: Fashion Hoodies
  #             &amp; Sweatshirts, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
  #           __LINE_NUM: 201}, {id: Pants, name: Pants, axisId: order_items.count,
  #           __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 204},
  #         {id: Shorts, name: Shorts, axisId: order_items.count, __FILE: shiggins_patterns/business_pulse.dashboard.lookml,
  #           __LINE_NUM: 207}, {id: Sweaters, name: Sweaters, axisId: order_items.count,
  #           __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 210}],
  #       showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
  #       type: linear, __FILE: shiggins_patterns/business_pulse.dashboard.lookml, __LINE_NUM: 192}]
  #   x_axis_reversed: false
  #   y_axis_reversed: false
  #   note_state: collapsed
  #   note_display: hover
  #   note_text: ''
  #   series_types: {}
  #   listen: {}
  #   row: 45
  #   col: 0
    width: 1
    height: 1
