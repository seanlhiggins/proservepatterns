connection: "thelook_events_redshift"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

include: "shiggins_patterns.model.lkml"
explore: user_growth {
  extends: [user_growth_base]
  fields: [ALL_FIELDS*,-user_growth.total_active_users]
}
