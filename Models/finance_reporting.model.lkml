connection: "connection_name"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: v_fact_ad_sales {
  access_filter: {
    field: dim_country.country
    user_attribute: country
  }
  join: dim_country {}
  join: finance_reporting {
    required_access_grants: [can_access_dfp, can_access_op]
  }
}

access_grant: can_access_dfp  {
  user_attribute: cnni_access_group_name
  allowed_values: [ "DFP_|_EMEA_TURNER_|_UK_|_FINANCE_ALLOWED", "dev", "operations", "strategic_planning", "audiences_and_data", "product", "social", "research", "create"]
}
