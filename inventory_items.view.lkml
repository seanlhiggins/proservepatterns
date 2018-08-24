
view: inventory_items {
  sql_table_name: public.INVENTORY_ITEMS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }
  parameter: view_label {
    type: string
    default_value: "The Money Zone"
  }

  dimension: cost {
#     view_label: "{% parameter view_label %}"
    type: number
    sql: 1 ;;
  }

  dimension: cost_ex_vat {
#     view_label: "{% parameter view_label %}"
    type: number
    sql: ${TABLE}.COST_EX_VAT ;;
  }

  dimension: cost_eur {
#     view_label: "{% parameter view_label %}"
    type: number
    sql: ${TABLE}.COST_EUR ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.CREATED_AT ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.PRODUCT_BRAND ;;
    suggest_explore: products
    suggest_dimension: products.brand_filter
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.PRODUCT_CATEGORY ;;
    suggest_explore: products
    suggest_dimension: products.category_filter
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.PRODUCT_DEPARTMENT ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.PRODUCT_DISTRIBUTION_CENTER_ID ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.PRODUCT_ID ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.PRODUCT_NAME ;;
  }
  dimension: product_match {
    type: yesno
    sql: ${product_name} = {% parameter product_name_selection %}  ;;
  }
  parameter: product_name_selection {
    default_value: "Ray-Ban RB2132 New Wayfarer Sunglasses"
    allowed_value: {
      value: "Ray-Ban RB2132 New Wayfarer Sunglasses"
      label: "Ray-Ban RB2132 New Wayfarer Sunglasses"
    }
    allowed_value: {
      value: "Levi's Men's 501 Jean"
      label: "Levi's Men's 501 Jean"
    }
    allowed_value: {
      value: "Columbia Men's Steens Mountain Full Zip"
      label: "Columbia Men's Steens Mountain Full Zip"
    }
  }
  parameter: brand_selection {
    allowed_value: {
      value: "Calvin Klein"
      label: "Calvin Klein"
    }
    allowed_value: {
      value: "Volcom"
      label: "Volcom"
    }
  }
  parameter: category_selection {
    allowed_value: {
      value: "Jeans"
      label: "Jeans"
    }
    allowed_value: {
      value: "Accessories"
      label: "Accessories"
    }
  }
  parameter: retail_price_upper_bound {
    type: unquoted
    allowed_value: {
      value: "100"
      label: "100"
    }
    allowed_value: {
      value: "75"
      label: "75"
    }
    allowed_value: {
      value: "50"
      label: "50"
    }
  }

  measure: sum_if_conditional_measure {
    type: sum
    sql: CASE WHEN ${product_brand} = {% parameter brand_selection %}
    AND ${product_category} = {% parameter category_selection %}
    AND ${product_retail_price} <= {% parameter retail_price_upper_bound %}
    THEN
    ${product_retail_price}
    ELSE NULL
    END;;
    value_format_name: usd
  }

  measure: count_product_name {
    sql: CASE WHEN ${product_name} = {% parameter product_name_selection %} THEN ${id} ELSE NULL END ;;
    type: count_distinct
  }
  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.PRODUCT_RETAIL_PRICE ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.PRODUCT_SKU ;;
  }

  dimension_group: sold {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.SOLD_AT ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }
}
