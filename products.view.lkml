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

  dimension: brand {
    group_label: "{% parameter view_label %}"
    type: string
    sql: ${TABLE}.BRAND ;;
  }

  dimension: category {
    group_label: "{% parameter view_label %}"

    type: string
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
    drill_fields: [id, name, distribution_centers.id, distribution_centers.name, inventory_items.count]
  }
}
