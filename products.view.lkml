view: products {
  sql_table_name: public.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  parameter: metric {
    default_value: "Rev"
    type: unquoted
    allowed_value: {value:"Rev"}
    allowed_value: {value:"CPO"}
    allowed_value: {value:"CPC"}
    allowed_value: {value:"CPM"}
    allowed_value: {value:"Cost"}
    allowed_value: {value:"Clicks"}
  }

  dimension: test_dimension {
    type: string
    sql: {% if metric._parameter_value == "Rev" %}'How much revenue have we made in the current period?'
          {% elsif metric._parameter_value == "CPO" %}'What is the average Cost per Sale in the current period?'
          {% elsif metric._parameter_value == "CPC" %}'What is the average spent per click in the current period?'
          {% elsif metric._parameter_value == "CPM" %}'How much was spent on every thousand impressions in the current period?'
          {% elsif metric._parameter_value == "Cost" %}'How much total budget have we spent in the current period?'
          {% elsif metric._parameter_value == "Clicks" %}'How many total clicks have we generated in the current period?'
          {% else %} {{ metric._parameter_value}}
          {% endif %}
          ;;
      #     html: {{_user_attributes['brand']}} ;;
    }
  dimension: category {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    sql: TRIM(${TABLE}.category) ;;
    drill_fields: [item_name]
  }

  dimension: item_name {
    sql: TRIM(${TABLE}.name) ;;
  }

  dimension: brand {
    hidden:no
    sql:
    TRIM(${TABLE}.brand)
     ;;

    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }

    link: {
      label: "Facebook"
      url: "http://www.google.com/search?q=site:facebook.com+{{ value | encode_uri }}+clothes&btnI"
      icon_url: "https://upload.wikimedia.org/wikipedia/commons/c/c2/F_icon.svg"
    }

    link: {
      label: "{{value}} Analytics Dashboard"
      url: "/dashboards/8?Brand%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    # html: <a href = "http://www.google.com/search?q={{ value | encode_uri }}+clothes&btnI"><u>{{rendered_value}}</u></a> ;;

    drill_fields: [category, item_name]
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: department {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    sql: TRIM(${TABLE}.department) ;;
  }

  dimension: sku {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    sql: ${TABLE}.sku ;;
  }

  dimension: distribution_center_id {
    type: number
    sql: ${TABLE}.distribution_center_id ;;
  }

  ## Custom header name selector
  parameter: header_name {
    type: unquoted
    default_value: "All"
    allowed_value: {label:"Customer A" value:"Customer_A"}
    allowed_value: {label:"Customer B" value:"Customer_B"}
  }
  ## MEASURES ##

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: brand_count {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    type: count_distinct
    sql: ${brand} ;;
    drill_fields: [brand, detail2*, -brand_count] # show the brand, a bunch of counts (see the set below), don't show the brand count, because it will always be 1
  }

  measure: category_count {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    alias: [category.count]
    type: count_distinct
    sql: ${category} ;;
    drill_fields: [category, detail2*, -category_count] # don't show because it will always be 1
  }

  measure: department_count {
#     label: "{% if products.header_name._parameter_value == 'Customer_A' %} Customer A's {{_field._name}} {% elsif products.header_name._parameter_value == 'Customer_B' %} Customer B's {{_field._name}} {% else %} {{_field._name}} {% endif %}"
    alias: [department.count]
    type: count_distinct
    sql: ${department} ;;
    drill_fields: [department, detail2*, -department_count] # don't show because it will always be 1
  }

  set: detail {
    fields: [id, item_name, brand, category, department, retail_price, customers.count, orders.count, order_items.count, inventory_items.count]
  }

  set: detail2 {
    fields: [category_count, brand_count, department_count, count, customers.count, orders.count, order_items.count, inventory_items.count, products.count]
  }
}
