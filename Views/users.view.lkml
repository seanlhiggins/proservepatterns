# view: users_2 {
#   dimension:id {sql: 1;;}
#   }
view: users {
  sql_table_name:
public.users
  ;;
  ## Demographics ##


  dimension: id {
    primary_key: yes
    type: date
    sql: ${TABLE}.id ;;
    tags: ["user_id"]

  }

  filter: user_id_selector {
    type: number

  }

  parameter: test {
    type: string
    allowed_value: {value: "test"}
    allowed_value: {value: "test1"}
  }
  dimension: first_name {
    hidden: yes
    sql: INITCAP(${TABLE}.first_name) ;;
  }

  dimension: case_when_test_delete {
    sql: CASE WHEN ${age} = 18 THEN 9999 ELSE ${age} END ;;
  }

  dimension: last_name {
    hidden: yes
    sql: INITCAP(${TABLE}.last_name) ;;
  }

  dimension: name {
    sql: ${first_name} || ' ' || ${last_name} ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
    # required_access_grants: [can_see_pii_fields]
  }

  dimension: age_tier {
    type: tier
    tiers: [0, 10, 20, 30, 40, 50, 60, 70]
    style: integer
#     html: <div href="https://www.google.com/">{{linked_value}}</div> ;;
    sql: ${age} ;;
#     order_by_field: count
  }

  dimension: gender {
    sql: ${TABLE}.gender ;;
    drill_fields: [email]
  }

  dimension: gender_short {
    sql: LOWER(LEFT(${gender},1)) ;;
  }

  dimension: user_image {
    sql: ${image_file} ;;
    html: <img src="{{ value }}" width="220" height="220"/>;;
  }

  dimension: email {
    sql: ${TABLE}.email ;;
    tags: ["email"]

    link: {
      label: "User Lookup Dashboard"
      url: "http://demo.looker.com/dashboards/160?Email={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
    action: {
      label: "Email Promotion to Customer"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Thank you {{ users.name._value }}"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Dear {{ users.first_name._value }},

        Thanks for your loyalty to the Look.  We'd like to offer you a 10% discount
        on your next purchase!  Just use the code LOYAL when checking out!

        Your friends at the Look"
      }
    }
    required_fields: [name, first_name]
  }

  dimension: image_file {
    hidden: yes
    sql: ('https://docs.looker.com/assets/images/'||${gender_short}||'.jpg') ;;
  }

  ## Demographics ##

  dimension: city {
    sql: ${TABLE}.city ;;
    drill_fields: [zip]
  }

  dimension: state {
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
    drill_fields: [zip, city]
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: uk_postcode {
    label: "UK Postcode"
    sql: CASE WHEN ${TABLE}.country = 'UK' THEN TRANSLATE(LEFT(${zip},2),'0123456789','') END ;;
    map_layer_name: uk_postcode_areas
    drill_fields: [city, zip]
  }

  dimension: country {
    map_layer_name: countries
    drill_fields: [state, city]
#     sql: CASE WHEN ${TABLE}.country = 'UK' THEN 'United Kingdom'
#            ELSE ${TABLE}.country
#            END
      sql: ${TABLE}.country ;;
      suggestions: ["Ireland"]
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  dimension: approx_location {
    type: location
    drill_fields: [location]
    sql_latitude: round(${TABLE}.latitude,1) ;;
    sql_longitude: round(${TABLE}.longitude,1) ;;
  }

  ## Other User Information ##

  dimension_group: created {

    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: history {
    sql: ${TABLE}.id ;;
    html: <a href="/explore/thelook/order_items?fields=order_items.detail*&f[users.id]={{ value }}">Order History</a>
      ;;
  }

  dimension: traffic_source {
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: ssn {
    # dummy field used in next dim
    hidden: yes
    type: number
    sql: lpad(cast(round(random() * 10000, 0) as char(4)), 4, '0') ;;
  }

  dimension: ssn_last_4 {
    label: "SSN Last 4"
    description: "Only users with sufficient permissions will see this data"
    type: string
    sql:
          CASE  WHEN '{{_user_attributes["can_see_sensitive_data"]}}' = 'yes'
                THEN ${ssn}
                ELSE MD5(${ssn}||'salt')
          END;;
    html:
          {% if _user_attributes["can_see_sensitive_data"]  == 'yes' %}
          {{ value }}
          {% else %}
            ####
          {% endif %}  ;;
  }

  ## MEASURES ##

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_percent_of_total {
    label: "Count (Percent of Total)"
    type: percent_of_total
    sql: ${count} ;;
    drill_fields: [detail*]
  }

  measure: average_age {
    type: average
    value_format_name: decimal_2
    sql: ${age} ;;
    drill_fields: [detail*]
  }

  parameter: adding_to_some_measure {
    type: number
    default_value: "5"

  }
#   measure: count_plus_param {
#     sql:
#     {% unless users.adding_to_some_measure._parameter_value == blank %}
#     ${count}+{{ users.adding_to_some_measure._parameter_value }}
#     {% else %}
#     ${count}
#     {% endunless %}
#     ;;
#     type: number
#   }
  set: detail {
    fields: [id, name, email, age, created_date, orders.count, order_items.count]
  }
}
