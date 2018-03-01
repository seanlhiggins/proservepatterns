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
}

view: rolling_growth_metrics {
  derived_table: {
    persist_for: "6 hours"
    distribution_style: all

    sql: SELECT cal_dt
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
          ON cal_dt >= users.created_at
      LEFT JOIN ${interval_windows.SQL_TABLE_NAME} AS prev
          ON cal_dt - 30 BETWEEN prev.start AND prev.end
          AND users.id = prev.user_id
      LEFT JOIN ${interval_windows.SQL_TABLE_NAME} AS curr
          ON cal_dt BETWEEN curr.start AND curr.end
          AND users.id = curr.user_id
      GROUP BY 1
      ORDER BY 1 ;;

    }
    dimension_group: calendar_date {label: "Calendar" sql: ${TABLE}.cal_dt ;; type: time timeframes:[date,week,month,year,day_of_week,week_of_year,month_name]}
    measure: user_reactivation_rate {type:sum value_format_name:percent_1}
    measure: user_activation_rate {type:sum value_format_name:percent_1}
    measure: user_retention_rate {type:sum value_format_name:percent_1}
    measure: total_active_users {type:sum}

  }

  view: interval_windows {
    derived_table: {
      persist_for: "24 hours"
      distribution_style: all

      sql: WITH daily_activity AS (
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
        ,end
    FROM (
        SELECT user_id
            ,event_dt AS start
            ,COALESCE(
                LEAD(event_dt, 1) OVER (
                    PARTITION BY user_id
                    ORDER BY event_dt ASC
                ),
                CURRENT_DATE
            ) - 1 AS end
            ,active
        FROM deduplication
    )
    WHERE active
 ;;
    }
    measure: count {type: count drill_fields: [detail*]}
    dimension: user_id {type: number sql: ${TABLE}.user_id ;;}
    dimension_group: start {type: time sql: ${TABLE}.start ;;}
    dimension_group: end {type: time sql: ${TABLE}.end ;;}
    set: detail {
      fields: [user_id, start_time, end_time]
    }
  }
