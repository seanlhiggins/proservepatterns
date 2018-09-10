view: products_extended {
  extends: [products]
  dimension: brand {}
}
view: products {
  sql_table_name: public.PRODUCTS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  parameter: view_label {
    type: string
    default_value: "The Money Zone"
  }
  parameter: image_url {
    type: unquoted
  }
  dimension: product_image {
    sql: 1;;
    html: <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSq7OyHRIDa1t4Mnbk6U4Ac3U_{{ products.image_url._parameter_value }}" ;;
  }

  parameter: brand_selector {
    default_value: "TEST"
    allowed_value: {
      value: "Test"
      label: "Test"
    }
    suggest_dimension: brand
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.BRAND ;;
    html:
    {% if products.category._value =='Jeans' AND products.category._is_selected %}
    <a href="https://profservices.dev.looker.com/dashboards/47?Category={{ category._value | encode_uri }}">{{rendered_value}}</a>
    {% else %}
    {{linked_value}}
    {% endif %}
    ;;
  }

  dimension: brand_filter {
    hidden: yes
    sql: ${TABLE}.BRAND ;;
  }
  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
    suggest_explore: products
    suggest_dimension: products.category_filter
  }

  dimension: category_filter {
    hidden: yes
    sql: ${TABLE}.CATEGORY ;;
  }
  dimension: cost {
    group_label: "{% if _explore._name   == 'order_items' %} Product Subcategory
    {% elsif _explore._name == 'Products' %} Brand
    {% else %} Products {% endif %}"
    type: number
    sql: ${TABLE}.COST ;;
  }

  dimension: department {
    group_label: "{% if _explore._name   == 'order_items' %} Product Subcategory
    {% elsif _explore._name == 'Products' %} Brand
    {% else %} Products {% endif %}"
    type: string
    sql: ${TABLE}.DEPARTMENT ;;
  }

  dimension: distribution_center_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.DISTRIBUTION_CENTER_ID ;;
  }

  dimension: name {
    group_label: "{% if _explore._name   == 'order_items' %} Product Subcategory
    {% elsif _explore._name == 'Products' %} Brand
    {% else %} Products {% endif %}"
    type: string
    sql: ${TABLE}.NAME ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.RETAIL_PRICE ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.SKU ;;
  }

  measure: count {
    type: count
    html:
    {% if products.category._value =='Jeans' %}
    <a href="https://profservices.dev.looker.com/dashboards/47?Category={{ category.value | encode_uri }}">{{linked_value}}</a>
    {% else %}
    HIDDEN
    {% endif %}
    ;;
    drill_fields: [id, name, distribution_centers.id, distribution_centers.name, inventory_items.count]
  }
}
