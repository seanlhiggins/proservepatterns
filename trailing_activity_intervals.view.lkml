#Parameterised View
view: parameter_intervals {
  derived_table: {

    sql: WITH interval_windows AS (WITH daily_activity AS (
        -- ## 2 ) Create a table of days and activity by user_id
        SELECT
          user_id
          , DATE_TRUNC('day', created_at) as activity_dt
        FROM public.order_items
        GROUP BY 1, 2
      ),
      events AS (
        SELECT user_id
            ,activity_dt AS event_dt
            ,1 AS days_active_delta
        FROM daily_activity
        UNION ALL
        SELECT user_id
            ,activity_dt + {% parameter time_interval_range %} AS event_dt
            ,-1 AS days_active_delta
        FROM daily_activity
        UNION ALL
        SELECT id as user_id
            ,created_at AS event_dt
            ,0 AS days_active_delta
        FROM users
    ),
    continuous_status AS (
        SELECT user_id
            ,event_dt
            ,SUM(days_active_delta) OVER (
                PARTITION BY user_id
                ORDER BY event_dt ASC
                ROWS UNBOUNDED PRECEDING
            ) AS days_active
        FROM (
            SELECT user_id
                ,event_dt
                ,SUM(days_active_delta) AS days_active_delta
            FROM events
            GROUP BY 1, 2
        )
    ),
    deduplication AS (
        SELECT user_id
            ,event_dt
            ,days_active
        FROM (
            SELECT user_id
                ,event_dt
                ,days_active
                ,COALESCE(
                    days_active = LAG(days_active, 1) OVER (
                        PARTITION BY user_id
                        ORDER BY event_dt ASC
                    ),
                    FALSE
                ) AS duplicate
            FROM continuous_status
        )
        WHERE NOT duplicate
    )
    SELECT user_id
        ,start
        ,end_time
        ,days_active
    FROM (
        SELECT user_id
            ,event_dt AS start
            ,COALESCE(
                LEAD(event_dt, 1) OVER (
                    PARTITION BY user_id
                    ORDER BY event_dt ASC
                ),
                CURRENT_DATE
            ) - 1 AS end_time
            ,days_active
        FROM deduplication
    )
    WHERE days_active > 0
 )
  SELECT cal_dt
          ,COUNT(CASE
              WHEN curr.user_id IS NOT NULL
              THEN 1 END) AS total_active_users
          ,COUNT(CASE
              WHEN cal_dt <= created_at + ({% parameter time_interval_range %}-1)
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN cal_dt <= created_at + ({% parameter time_interval_range %}-1)
              THEN 1 END), 0)::FLOAT AS user_activation_rate
          ,COUNT(CASE
              WHEN prev.user_id IS NOT NULL
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN prev.user_id IS NOT NULL
              THEN 1 END), 0)::FLOAT AS user_retention_rate
          ,COUNT(CASE
              WHEN prev.user_id IS NULL
                  AND cal_dt - {% parameter time_interval_range %} >= created_at
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN prev.user_id IS NULL
                  AND cal_dt - {% parameter time_interval_range %} >= created_at
              THEN 1 END), 0)::FLOAT AS user_reactivation_rate
      FROM ${calendar.SQL_TABLE_NAME}
      JOIN users
          ON cal_dt >= users.created_at
      LEFT JOIN interval_windows AS prev
          ON cal_dt - {% parameter time_interval_range %} BETWEEN prev.start AND prev.end_time
          AND users.id = prev.user_id
          AND {% condition days_user_active %} prev.days_active {% endcondition %}
      LEFT JOIN interval_windows AS curr
          ON cal_dt BETWEEN curr.start AND curr.end_time
          AND users.id = curr.user_id
          AND {% condition days_user_active %} curr.days_active {% endcondition %}
      GROUP BY 1
      ORDER BY 1 ;;
  }
  parameter: time_interval_range {
    type: unquoted
    allowed_value: {
      label: "7 days"
      value: "7"
    }
    allowed_value: {
      label: "30 days"
      value: "30"
    }
    allowed_value: {
      label: "60 days"
      value: "60"
    }
    allowed_value: {
      label: "90 days"
      value: "90"
    }
    allowed_value: {
      label: "180 days"
      value: "180"
    }
    allowed_value: {
      label: "365 days"
      value: "365"
    }
  }
  filter: days_user_active {
    type: number
  }
  dimension_group: calendar_date {label: "Calendar" sql: ${TABLE}.cal_dt ;; type: time timeframes:[date,week,month,year,day_of_week,week_of_year,month_name]}
  measure: user_reactivation_rate {type:sum value_format_name:percent_1}
  measure: user_activation_rate {type:sum value_format_name:percent_1}
  measure: user_retention_rate {type:sum value_format_name:percent_1}
  measure: total_active_users {type:sum}

}

view: calendar {
  derived_table: {
    distribution_style: all
    sortkeys: ["cal_dt"]
    sql_trigger_value:  GETDATE() ;;
    sql: -- ## 1) Create a Date table with a row for each date.
      SELECT '2001-01-01'::DATE + d AS cal_dt
       FROM
       (SELECT ROW_NUMBER() OVER(ORDER BY id) -1 AS d FROM order_items ORDER BY id LIMIT 20000) AS  d
       ;;
  }
  dimension_group: date {
    convert_tz: no
    type: time
    timeframes: [date,week,month,year]
  }
}

view: user_growth {
  derived_table: {
    persist_for: "6 hours"
    distribution_style: all

    sql:  SELECT cal_dt
          ,COUNT(CASE
              WHEN curr.user_id IS NOT NULL
              THEN 1 END) AS total_active_users
          ,COUNT(CASE
              WHEN cal_dt <= created_at + 29
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN cal_dt <= created_at + 29
              THEN 1 END), 0)::FLOAT AS user_activation_rate
          ,COUNT(CASE
              WHEN prev.user_id IS NOT NULL
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN prev.user_id IS NOT NULL
              THEN 1 END), 0)::FLOAT AS user_retention_rate
          ,COUNT(CASE
              WHEN prev.user_id IS NULL
                  AND cal_dt - 30 >= created_at
                  AND curr.user_id IS NOT NULL
              THEN 1 END) /
          NULLIF(COUNT(CASE
              WHEN prev.user_id IS NULL
                  AND cal_dt - 30 >= created_at
              THEN 1 END), 0)::FLOAT AS user_reactivation_rate
      FROM ${calendar.SQL_TABLE_NAME}
      JOIN users
          ON cal_dt >= CAST(users.created_at as DATE)
      LEFT JOIN ${interval_windows.SQL_TABLE_NAME} AS prev
          ON cal_dt - 30 BETWEEN prev.start AND prev.end_time
          AND users.id = prev.user_id
      LEFT JOIN ${interval_windows.SQL_TABLE_NAME} AS curr
          ON cal_dt BETWEEN curr.start AND curr.end_time
          AND users.id = curr.user_id
      GROUP BY 1
      ORDER BY 1 ;;

    }
    dimension_group: calendar_date {convert_tz: no label: "Calendar" sql: ${TABLE}.cal_dt ;; type: time timeframes:[date,week,month,year,day_of_week,week_of_year,month_name]}
    dimension: start {convert_tz: no type:date}
  dimension: end_time {convert_tz: no type:date}

    dimension: user_id {sql: ${TABLE}.user_id;; type:number }
measure: user_reactivation_rate {
  type:sum
  value_format_name:percent_1
  drill_fields: [detail*]
  sql: ${TABLE}.user_reactivation_rate ;;
  description: "User Reactivation Rate"
  html: <span title="Reactivation Definition:
  The rate at which a user re-engages with our platform">{{linked_value}}</span>;;
  }

    measure: user_activation_rate {type:sum value_format_name:percent_1}
    measure: user_retention_rate {type:sum value_format_name:percent_1}
    measure: total_active_users {type:sum drill_fields:[user_id]}
    set: detail { fields: [calendar_date_date,user_activation_rate,user_reactivation_rate,user_retention_rate,start]}
  }

  view: interval_windows {
    derived_table: {
      persist_for: "24 hours"
      distribution_style: all

      sql:  WITH daily_activity AS (
        -- ## 2 ) Create a table of days and activity by user_id
        SELECT
          user_id
          , DATE_TRUNC('day', created_at) as activity_dt
        FROM public.order_items
        GROUP BY 1, 2
      ),
      events AS (
        SELECT user_id
            ,activity_dt AS event_dt
            ,1 AS days_active_delta
        FROM daily_activity
        UNION ALL
        SELECT user_id
            ,activity_dt + 30 AS event_dt
            ,-1 AS days_active_delta
        FROM daily_activity
        UNION ALL
        SELECT id as user_id
            ,created_at AS event_dt
            ,0 AS days_active_delta
        FROM users
    ),
    continuous_status AS (
        SELECT user_id
            ,event_dt
            ,SUM(days_active_delta) OVER (
                PARTITION BY user_id
                ORDER BY event_dt ASC
                ROWS UNBOUNDED PRECEDING
            ) > 0 AS active
        FROM (
            SELECT user_id
                ,event_dt
                ,SUM(days_active_delta) AS days_active_delta
            FROM events
            GROUP BY 1, 2
        )
    ),
    deduplication AS (
        SELECT user_id
            ,event_dt
            ,active
        FROM (
            SELECT user_id
                ,event_dt
                ,active
                ,COALESCE(
                    active = LAG(active, 1) OVER (
                        PARTITION BY user_id
                        ORDER BY event_dt ASC
                    ),
                    FALSE
                ) AS duplicate
            FROM continuous_status
        )
        WHERE NOT duplicate
    )
    SELECT user_id
        ,start
        ,end_time
    FROM (
        SELECT user_id
            ,event_dt AS start
            ,COALESCE(
                LEAD(event_dt, 1) OVER (
                    PARTITION BY user_id
                    ORDER BY event_dt ASC
                ),
                CURRENT_DATE
            ) - 1 AS end_time
            ,active
        FROM deduplication
    )
    WHERE active
 ;;
    }
    measure: count {type: count drill_fields: [detail*]}
    dimension: user_id {type: number sql: ${TABLE}.user_id ;;}
    dimension_group: start {type: time sql: ${TABLE}.start ;;}
    dimension_group: end_time {type: time sql: ${TABLE}.end_time ;;}
    set: detail {
      fields: [user_id, start_time, end_time_date]
    }
  }
#
