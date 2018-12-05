- dashboard: dynamic_criteo_tests
  title: Dynamic Criteo Tests
  layout: newspaper
  elements:
  - title: Dynamic text tile trick (copy)
    name: Dynamic text tile trick (copy)
    model: thelook_shiggins
    explore: order_items
    type: hello_world
    fields:
    - products.test_dimension
    filters: {}
    sorts:
    - products.test_dimension
    limit: 500
    query_timezone: Europe/Dublin
    font_size: small
    series_types: {}
    listen:
      Tile 2: products.metric
    title_hidden: true
    row: 0
    col: 3
    width: 3
    height: 2
  - title: Dynamic text tile trick
    name: Dynamic text tile trick
    model: thelook_shiggins
    explore: order_items
    type: hello_world
    fields:
    - products.test_dimension
    filters: {}
    sorts:
    - products.test_dimension
    limit: 500
    query_timezone: Europe/Dublin
    font_size: small
    series_types: {}
    listen:
      Tile 1: products.metric
    title_hidden: true
    row: 0
    col: 0
    width: 3
    height: 2
  - title: Dynamic text tile trick (copy 3)
    name: Dynamic text tile trick (copy 3)
    model: thelook_shiggins
    explore: order_items
    type: hello_world
    fields:
    - products.test_dimension
    filters: {}
    sorts:
    - products.test_dimension
    limit: 500
    query_timezone: Europe/Dublin
    font_size: small
    series_types: {}
    listen:
      Tile 4: products.metric
    title_hidden: true
    row: 0
    col: 9
    width: 3
    height: 2
  - title: Dynamic text tile trick (copy 4)
    name: Dynamic text tile trick (copy 4)
    model: thelook_shiggins
    explore: order_items
    type: hello_world
    fields:
    - products.test_dimension
    filters: {}
    sorts:
    - products.test_dimension
    limit: 500
    query_timezone: Europe/Dublin
    font_size: small
    series_types: {}
    listen:
      Tile 5: products.metric
    title_hidden: true
    row: 0
    col: 12
    width: 3
    height: 2
  - title: Dynamic text tile trick (copy 2)
    name: Dynamic text tile trick (copy 2)
    model: thelook_shiggins
    explore: order_items
    type: hello_world
    fields:
    - products.test_dimension
    filters: {}
    sorts:
    - products.test_dimension
    limit: 500
    query_timezone: Europe/Dublin
    font_size: small
    series_types: {}
    listen:
      Tile 3: products.metric
    title_hidden: true
    row: 0
    col: 6
    width: 3
    height: 2
  filters:
  - name: Tile 1
    title: Tile 1
    type: field_filter
    default_value: Rev
    allow_multiple_values: true
    required: false
    model: thelook_shiggins
    explore: order_items
    listens_to_filters: []
    field: products.metric
  - name: Tile 2
    title: Tile 2
    type: field_filter
    default_value: CPO
    allow_multiple_values: true
    required: false
    model: thelook_shiggins
    explore: order_items
    listens_to_filters: []
    field: products.metric
  - name: Tile 3
    title: Tile 3
    type: field_filter
    default_value: CPC
    allow_multiple_values: true
    required: false
    model: thelook_shiggins
    explore: order_items
    listens_to_filters: []
    field: products.metric
  - name: Tile 4
    title: Tile 4
    type: field_filter
    default_value: CPM
    allow_multiple_values: true
    required: false
    model: thelook_shiggins
    explore: order_items
    listens_to_filters: []
    field: products.metric
  - name: Tile 5
    title: Tile 5
    type: field_filter
    default_value: Clicks
    allow_multiple_values: true
    required: false
    model: thelook_shiggins
    explore: order_items
    listens_to_filters: []
    field: products.metric
