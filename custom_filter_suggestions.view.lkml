view: dummy_measures {
  view_label: "Measures"
  derived_table: {
    sql: SELECT 22.05 as revenue, 31 as sort, EXTRACT(week from DATE_ADD('week',-4,CURRENT_DATE)) as week
UNION
SELECT 28.35, 32 as sort, EXTRACT(week from DATE_ADD('week',-3,CURRENT_DATE)) as week
UNION
SELECT 16.02, 33 as sort, EXTRACT(week from DATE_ADD('week',-2,CURRENT_DATE)) as week
UNION
SELECT 47.18, 34 as sort, EXTRACT(week from DATE_ADD('week',-1,CURRENT_DATE)) as week
UNION
SELECT 26.86, 35 as sort, EXTRACT(week from DATE_ADD('week',-0,CURRENT_DATE)) as week
UNION
SELECT 19.43, 35 as sort, EXTRACT(week from DATE_ADD('week',1,CURRENT_DATE)) as week ;;
  }



  measure: revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
  }
  dimension: week {
    hidden: yes
    type: number
    sql: ${TABLE}.week ;;
  }
}
explore: normal_dt_without_filter {
  cancel_grouping_fields: [normal_dt_without_filter.week_number]
  view_label: "Dim Date"
  join: dummy_measures {
    sql_on: ${normal_dt_without_filter.week} = ${dummy_measures.week} ;;
    relationship: one_to_one
  }
}
view: normal_dt_without_filter {
  derived_table: {
    sql:
    SELECT week_name, week FROM(
    SELECT '2018 - Wk 31' as week_name, 31 as sort, EXTRACT(week from DATE_ADD('week',-4,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 32', 32 as sort, EXTRACT(week from DATE_ADD('week',-3,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 33', 33 as sort, EXTRACT(week from DATE_ADD('week',-2,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 34', 34 as sort, EXTRACT(week from DATE_ADD('week',-1,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 35', 35 as sort, EXTRACT(week from DATE_ADD('week',-0,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 36', 35 as sort, EXTRACT(week from DATE_ADD('week',1,CURRENT_DATE)) as week)
order by week
;;
}
# dimension: week_name {
#   sql: ${TABLE}.week_name ;;
#   suggest_explore: custom_filter_suggestions
#   suggest_dimension: custom_filter_suggestions.week_name_filtered
#   order_by_field: week
# }
dimension: week {
  type: number
  hidden: yes
  sql: ${TABLE}.week ;;
}

  measure: week_number {
    type: number
    sql: rank() over (order by (replace(${TABLE}.WEEK_NAME, ' - Wk ',''))::INTEGER desc) ;;
  }

  dimension: week_name {
    type: string
    sql: ${TABLE}.WEEK_NAME ;;


#     suggest_explore: mtep_dim_week_filtered
    suggest_dimension: week_name_filtered_hidden
    # suggest_explore: mtep_dim_week_current_week
    # suggest_dimension: mtep_dim_week.week_name_filtered_hidden
  }

  dimension: week_name_filtered_hidden {
    hidden: yes
    type: string
    sql: ${TABLE}.WEEK_NAME ;;
#     order_by_field: week_number
  }
}


explore: custom_filter_suggestions {
  hidden: yes
}
view: custom_filter_suggestions {
  derived_table: {
    sql: SELECT week_name, week FROM(
SELECT '2018 - Wk 31' as week_name, 31 as sort, EXTRACT(week from DATE_ADD('week',-4,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 32', 32 as sort, EXTRACT(week from DATE_ADD('week',-3,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 33', 33 as sort, EXTRACT(week from DATE_ADD('week',-2,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 34', 34 as sort, EXTRACT(week from DATE_ADD('week',-1,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 35', 35 as sort, EXTRACT(week from DATE_ADD('week',-0,CURRENT_DATE)) as week
UNION
SELECT '2018 - Wk 36', 35 as sort, EXTRACT(week from DATE_ADD('week',1,CURRENT_DATE)) as week
)
WHERE
extract(week from CURRENT_DATE) = week
       ;;
  }
  dimension: week_name_filtered {
    type: string
    sql: ${TABLE}.week_name ;;
  }
}
