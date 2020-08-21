# explore:histogram_equalisation{}
view: histogram_equalisation {
  derived_table: {
    sql: SELECT ntile,
                  (min(age)|| '-' ||max(age)) as cohort,
                 Count(*) as total_orders,
                 sum(revenue) as revenue
          FROM   (SELECT age,
                         Ntile({{ num_buckets._parameter_value}}) OVER (ORDER BY age),
                         sale_price as revenue
                  FROM   order_items o
                  JOIN users u
                  ON u.id = o.user_id
                  ) x
          GROUP  BY 1
        ;;
  }
  parameter: num_buckets {
    description: "Select the number of buckets you want the orders to be broken down by i.e. how many cohorts do you want to see? More = granular, less = coarse."
    type: unquoted
    allowed_value: {value:"3"}
    allowed_value: {value:"5"}
    allowed_value: {value:"8"}
    allowed_value: {value:"10"}
    allowed_value: {value:"15"}
  }
  parameter: type_cohort {
    description: "Select what you want as the distribution of the buckets i.e. 'Age' will group the distribution into equal (approx) buckets based on # of users per age"
    type: unquoted
    allowed_value: {value:"Age"}
    allowed_value: {value:""}
    allowed_value: {value:"8"}
    allowed_value: {value:"10"}
    allowed_value: {value:"15"}
  }
  measure: revenue {type:sum}
  measure: total_orders {type:sum}
  dimension: ntile {type:number}
  dimension: cohort {}
}
