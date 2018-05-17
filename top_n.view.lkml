view: top_5_countries {
  label: "Countries Ranking"
  derived_table: {
    sql:
    select country as country,
    {% parameter country_name_criteria %} as country_rank

    from
    (
      select country,
      rank() over(order by count(*) desc) as visitorCount,
      rank() over(order by sum(order_items.sale_price) desc) as totalGrossRevenue,
      rank() over(order by avg(order_items.sale_price) desc) as averageGrossRevenue

      FROM order_items
      JOIN users ON order_items.user_id = users.id
      WHERE
      {% condition rank_date_range %}order_items.created_at {% endcondition %}
      group by country
    )country_summary
    ;;
  }

  filter: rank_date_range {
    type: date
    description: "Select a range within which you are ranking the ordering of countries by metric selection. E.g. the rank of countries who had the top 10 highest revenue in May"
  }
  dimension: country_code {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.country ;;
  }

  parameter: country_name_criteria {
    label: "Ranking Criteria"
    description: "Specify which metric to order the ranking by"
    type: unquoted

    default_value: "totalGrossRevenue"
    allowed_value: {
      label: "Total Gross Revenue"
      value: "totalGrossRevenue"
    }
    allowed_value: {
      label: "Average Gross Revenue"
      value: "averageGrossRevenue"
    }
    allowed_value: {
      label: "Visitor Count"
      value: "visitorCount"
    }

  }

#### This parameter will allow a user to select a Top N ranking limit for bucketing the countries, almost like parameterizing the Row Limit in the UI
  parameter: country_rank_limit {
    label: "Rank Limit"
    description: "Specify the cutoff for overall rank"
    type: unquoted
    default_value: "5"
    allowed_value: {
      label: "Top 5"
      value: "5"
    }
    allowed_value: {
      label: "Top 10"
      value: "10"
    }
    allowed_value: {
      label: "Top 20"
      value: "20"
    }
    allowed_value: {
      label: "Top 50"
      value: "50"
    }
  }

  dimension: country_rank_top_N {
    hidden: yes
    description: "Rank within the range selected and list of countries based on metric selected. Useful for sorting visualisation based on ranking."
    label_from_parameter: country_name_criteria
    label: "Country Code"
    type: number
    sql: case when ${TABLE}.country_rank<={% parameter country_rank_limit %} then ${TABLE}.country_rank else null end ;;
  }

  dimension: country_name_top_N {
    description: "Name of the Country within the rank selection."
    label: "Country Name (Top N)"
    type: string
    sql: case when ${TABLE}.country_rank<={% parameter country_rank_limit %} then ${TABLE}.country_code else 'other' end ;;
  }
}
