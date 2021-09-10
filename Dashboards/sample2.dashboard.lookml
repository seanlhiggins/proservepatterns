- dashboard: sample_dashboard_2
  title: Sample Dashboard 2
  extends: [sample,business_pulse]
  layout: newspaper
  elements:
  - title: Top 10 Brands
    name: Top 10 Brands
    model: thelook_shiggins
    explore: order_items
    type: looker_bar
    fields: [users.country, order_items.count, order_items.total_sale_price, top_5_brands.country_name_top_N]
    pivots: [users.country]
    filters:
      top_5_brands.rank_date_range: 2019/03/01 to 2019/03/30
      top_5_brands.brand_rank_limit: '10'
      top_5_brands.brand_name_criteria: visitorCount
      top_5_brands.country_name_top_N: "-other"
    sorts: [order_items.count desc 0, top_5_brands.country_name_top_N, users.country]
    limit: 500
    query_timezone: America/Los_Angeles
    stacking: normal
    trellis: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_types: {}
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
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    y_axes: []
    row: 1
    col: 1
    width: 9
    height: 6
  - name: ''
    type: text
    body_text: <a href="/explore/middle_level">Explore from here</a>
    row: 6
    col: 0
    width: 2
    height: 2
  - name: " (2)"
    type: text
    body_text: <img src="https://localhost/img.jpg">
    row: 0
    col: 9
    width: 8
    height: 6
