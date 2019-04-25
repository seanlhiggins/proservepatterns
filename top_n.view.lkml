explore: top_5_countries {}
view: top_5_countries {
  label: "Country Ranking"
  derived_table: {
    sql:
    select country,
    {% parameter country_name_criteria %} as country_rank

    from
    (
      select air_capacity_management.country as country,
      rank() over(order by count(*) desc) as flightCount,
      rank() over(order by sum(order_items.passenger_count) desc) as passengerCount,
      rank() over(order by avg(order_items.ticketPrice) desc) as ticketRevenue

--    India | 1 | 5 | 25
--    UK    | 5 | 3 | 2

      FROM air_capacity_management


      group by country
    )country_summary
    ;;
  }

  filter: rank_date_range {
    type: date
    description: "Select a range within which you are ranking the ordering of countries by metric selection. E.g. the rank of countries who had the top 10 highest revenue in May"
  }
  dimension: brand {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.brand ;;
  }

  parameter: country_name_criteria {
    label: "Ranking Criteria"
    description: "Specify which metric to order the ranking by"
    type: unquoted

    default_value: "Ticket Revenue"
    allowed_value: {
      label: "Ticket Revenue"
      value: "ticketRevenue"
    }
    allowed_value: {
      label: "Flight Count"
      value: "flightCount"
    }
    allowed_value: {
      label: "Passenger Count"
      value: "passengerCount"
    }

  }

#### This parameter will allow a user to select a Top N ranking limit for bucketing the countries, almost like parameterizing the Row Limit in the UI
  parameter: brand_rank_limit {
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

  dimension: brand_rank_top_N {
    hidden: yes
    description: "Rank within the range selected and list of countries based on metric selected. Useful for sorting visualisation based on ranking."
    label_from_parameter: brand_name_criteria
    label: "Brand Code"
    type: number
    sql: case when ${TABLE}.brand_rank<={% parameter brand_rank_limit %} then ${TABLE}.brand_rank else null end ;;
  }

  dimension: country_name_top_N {
    description: "Name of the Country within the rank selection."
    label: "Brand Name (Top N)"
    type: string
    sql: case when ${TABLE}.brand_rank<={% parameter brand_rank_limit %} then ${TABLE}.brand else 'other' end ;;
  }
}
