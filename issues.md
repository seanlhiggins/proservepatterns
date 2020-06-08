---
title: Issues - 155⛔ 494⚠️  
navigation: true
---

<p style="text-align:right;color:#cccs">
Generated Mon, 08 Jun 2020 16:26:32 GMT
</p>

<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:200%;">Issues (155⛔494⚠️)</summary>

<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#e2">E2</a>. Primary keys used (34⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:order_facts </td>
<td>No PKs dimensions used for order_facts in order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:order_facts </td>
<td>No PKs dimensions used for order_items in order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:inventory_items </td>
<td>No PKs dimensions used for inventory_items in inventory_items join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:inventory_items </td>
<td>No PKs dimensions used for order_items in inventory_items join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:users </td>
<td>No PKs dimensions used for users in users join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:user_order_facts </td>
<td>No PKs dimensions used for user_order_facts in user_order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:products </td>
<td>No PKs dimensions used for products in products join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:competitor_query </td>
<td>No PKs dimensions used for competitor_query in competitor_query join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:repeat_purchase_facts </td>
<td>No PKs dimensions used for repeat_purchase_facts in repeat_purchase_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:order_items&#47;join:distribution_centers </td>
<td>No PKs dimensions used for distribution_centers in distribution_centers join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:sessions </td>
<td>No PKs dimensions used for sessions in sessions join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:session_landing_page </td>
<td>No PKs dimensions used for session_landing_page in session_landing_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:session_landing_page </td>
<td>No PKs dimensions used for sessions in session_landing_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:session_bounce_page </td>
<td>No PKs dimensions used for session_bounce_page in session_bounce_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:product_viewed </td>
<td>No PKs dimensions used for product_viewed in product_viewed join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:users </td>
<td>No PKs dimensions used for users in users join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:user_order_facts </td>
<td>No PKs dimensions used for user_order_facts in user_order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:user_order_facts </td>
<td>No PKs dimensions used for users in user_order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:events_top_10 </td>
<td>No PKs dimensions used for events_top_10 in events_top_10 join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:events_shiggins&#47;join:events_top_10 </td>
<td>No PKs dimensions used for users in events_top_10 join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:events </td>
<td>No PKs dimensions used for sessions in events join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:product_viewed </td>
<td>No PKs dimensions used for product_viewed in product_viewed join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:session_landing_page </td>
<td>No PKs dimensions used for session_landing_page in session_landing_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:session_landing_page </td>
<td>No PKs dimensions used for sessions in session_landing_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:session_bounce_page </td>
<td>No PKs dimensions used for session_bounce_page in session_bounce_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:session_bounce_page </td>
<td>No PKs dimensions used for sessions in session_bounce_page join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:users </td>
<td>No PKs dimensions used for users in users join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:sessions&#47;join:user_order_facts </td>
<td>No PKs dimensions used for user_order_facts in user_order_facts join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:affinity&#47;join:product_a </td>
<td>No PKs dimensions used for product_a in product_a join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:affinity&#47;join:product_b </td>
<td>No PKs dimensions used for product_b in product_b join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:inventory_snapshot&#47;join:trailing_sales_snapshot </td>
<td>No PKs dimensions used for trailing_sales_snapshot in trailing_sales_snapshot join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:inventory_snapshot&#47;join:trailing_sales_snapshot </td>
<td>No PKs dimensions used for inventory_snapshot in trailing_sales_snapshot join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:inventory_snapshot&#47;join:products </td>
<td>No PKs dimensions used for products in products join</td>
</tr>
<tr>
<td>⛔</td>
<td>model:thelook_shiggins&#47;explore:inventory_snapshot&#47;join:distribution_centers </td>
<td>No PKs dimensions used for distribution_centers in distribution_centers join</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f1">F1</a>. No inter-view dependencies (24⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view:events&#47;field:is_exit_event </td>
<td>is_exit_event references another view, sessions,  via ${sessions.number_of_events_in_session}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:events&#47;field:has_user_id </td>
<td>has_user_id references another view, users,  via ${users.id}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_items&#47;field:stock_coverage_ratio </td>
<td>stock_coverage_ratio references another view, order_items,  via ${order_items.count_last_28d}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio </td>
<td>stock_coverage_ratio references another view, trailing_sales_snapshot,  via ${trailing_sales_snapshot.sum_trailing_28d_sales}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_yday </td>
<td>stock_coverage_ratio_yday references another view, trailing_sales_snapshot,  via ${trailing_sales_snapshot.sum_trailing_28d_sales_yesterday}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_last_wk </td>
<td>stock_coverage_ratio_last_wk references another view, trailing_sales_snapshot,  via ${trailing_sales_snapshot.sum_trailing_28d_sales_last_wk}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:labels&#47;field:overview_dynamic_dimension_title </td>
<td>overview_dynamic_dimension_title references another view, if overview_dimension_selector,  via {% if overview_dimension_selector._parameter_value ==  "'Campaign'"%}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:brand </td>
<td>brand references another view, products,  via ${products.brand}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:user_id_evens </td>
<td>user_id_evens references another view, user_id,  via {{user_id._value | modulo:2}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:date_breakdown </td>
<td>date_breakdown references another view, if date_granularity,  via {% if date_granularity._parameter_value == "Daily" %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:date_pivot </td>
<td>date_pivot references another view, if date_granularity,  via {% if date_granularity._parameter_value == "Hourly" %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:months_since_signup </td>
<td>months_since_signup references another view, users,  via ${users.created_raw}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:gross_margin </td>
<td>gross_margin references another view, inventory_items,  via ${inventory_items.cost}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:days_until_next_order </td>
<td>days_until_next_order references another view, repeat_purchase_facts,  via ${repeat_purchase_facts.next_order_raw}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:periods_as_customer </td>
<td>periods_as_customer references another view, user_order_facts,  via ${user_order_facts.first_order_date}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:dynamic_metric </td>
<td>dynamic_metric references another view, if metric_selector,  via {% if metric_selector._parameter_value =='Rev' %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:dynamic_metric_1 </td>
<td>dynamic_metric_1 references another view, if metric_selector_1,  via {% if metric_selector_1._parameter_value =='Rev' %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:dynamic_metric_2 </td>
<td>dynamic_metric_2 references another view, if metric_selector_2,  via {% if metric_selector_2._parameter_value =='Rev' %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:average_spend_per_user </td>
<td>average_spend_per_user references another view, users,  via ${users.count}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items&#47;field:cohort_values_0 </td>
<td>cohort_values_0 references another view, metric,  via {{  metric._parameter_value =="Order Count" }</td>
</tr>
<tr>
<td>⛔</td>
<td>view:pop&#47;field:reference_date_formatted </td>
<td>reference_date_formatted references another view, parameter pop,  via {% parameter pop.within_period_type %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:pop&#47;field:reference_date </td>
<td>reference_date references another view, parameter pop,  via {% parameter pop.within_period_type %}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:pop&#47;field:over_periods_ago </td>
<td>over_periods_ago references another view, over_periods,  via ${over_periods.n}</td>
</tr>
<tr>
<td>⛔</td>
<td>view:products&#47;field:test_dimension </td>
<td>test_dimension references another view, if metric,  via {% if metric._parameter_value == "Rev" %}</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f2">F2</a>. No view-labeled fields (42⚠️)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:ip </td>
<td>view:events/field:ip contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:location </td>
<td>view:events/field:location contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:approx_location </td>
<td>view:events/field:approx_location contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:has_user_id </td>
<td>view:events/field:has_user_id contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:browser </td>
<td>view:events/field:browser contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:os </td>
<td>view:events/field:os contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:unique_visitors </td>
<td>view:events/field:unique_visitors contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:unique_visitors_m </td>
<td>view:events/field:unique_visitors_m contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:unique_visitors_k </td>
<td>view:events/field:unique_visitors_k contains a field-level view_label "Visitors"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_yday </td>
<td>view:inventory_snapshot/field:stock_coverage_ratio_yday contains a field-level view_label "Stock Ratio Changes"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_last_wk </td>
<td>view:inventory_snapshot/field:stock_coverage_ratio_last_wk contains a field-level view_label "Stock Ratio Changes"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:wk_to_wk_change_coverage </td>
<td>view:inventory_snapshot/field:wk_to_wk_change_coverage contains a field-level view_label "Stock Ratio Changes"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:undefined </td>
<td>view:labels/field:undefined contains a field-level view_label "Text Tile Labels"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:undefined </td>
<td>view:labels/field:undefined contains a field-level view_label "Text Tile Labels"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:undefined </td>
<td>view:labels/field:undefined contains a field-level view_label "Text Tile Labels"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:undefined </td>
<td>view:labels/field:undefined contains a field-level view_label "Text Tile Labels"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:undefined </td>
<td>view:labels/field:undefined contains a field-level view_label "Text Tile Labels"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:months_since_signup </td>
<td>view:order_items/field:months_since_signup contains a field-level view_label "Orders"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:days_until_next_order </td>
<td>view:order_items/field:days_until_next_order contains a field-level view_label "Repeat Purchase Facts"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:repeat_orders_within_30d </td>
<td>view:order_items/field:repeat_orders_within_30d contains a field-level view_label "Repeat Purchase Facts"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:order_count </td>
<td>view:order_items/field:order_count contains a field-level view_label "Orders"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count_with_repeat_purchase_within_30d </td>
<td>view:order_items/field:count_with_repeat_purchase_within_30d contains a field-level view_label "Repeat Purchase Facts"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:30_day_repeat_purchase_rate </td>
<td>view:order_items/field:30_day_repeat_purchase_rate contains a field-level view_label "Repeat Purchase Facts"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:first_purchase_count </td>
<td>view:order_items/field:first_purchase_count contains a field-level view_label "Orders"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:hidden_first_purchase_visualization_link </td>
<td>view:order_items/field:hidden_first_purchase_visualization_link contains a field-level view_label "Orders"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:all_sessions </td>
<td>view:sessions/field:all_sessions contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_browse_or_later </td>
<td>view:sessions/field:count_browse_or_later contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_product_or_later </td>
<td>view:sessions/field:count_product_or_later contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_cart_or_later </td>
<td>view:sessions/field:count_cart_or_later contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_purchase </td>
<td>view:sessions/field:count_purchase contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:cart_to_checkout_conversion </td>
<td>view:sessions/field:cart_to_checkout_conversion contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:overall_conversion </td>
<td>view:sessions/field:overall_conversion contains a field-level view_label "Funnel View"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:item_comparison </td>
<td>view:order_items_share_of_wallet/field:item_comparison contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:brand_comparison </td>
<td>view:order_items_share_of_wallet/field:brand_comparison contains a field-level view_label "Share of Wallet (Brand Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:total_sale_price_this_item </td>
<td>view:order_items_share_of_wallet/field:total_sale_price_this_item contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:total_sale_price_this_brand </td>
<td>view:order_items_share_of_wallet/field:total_sale_price_this_brand contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:total_sale_price_brand_v2 </td>
<td>view:order_items_share_of_wallet/field:total_sale_price_brand_v2 contains a field-level view_label "Share of Wallet (Brand Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:item_share_of_wallet_within_brand </td>
<td>view:order_items_share_of_wallet/field:item_share_of_wallet_within_brand contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:item_share_of_wallet_within_company </td>
<td>view:order_items_share_of_wallet/field:item_share_of_wallet_within_company contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:brand_share_of_wallet_within_company </td>
<td>view:order_items_share_of_wallet/field:brand_share_of_wallet_within_company contains a field-level view_label "Share of Wallet (Brand Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:undefined </td>
<td>view:order_items_share_of_wallet/field:undefined contains a field-level view_label "Share of Wallet (Item Level)"</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:undefined </td>
<td>view:order_items_share_of_wallet/field:undefined contains a field-level view_label "Share of Wallet (Brand Level)"</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f3">F3</a>. Count fields filtered (14⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view:affinity&#47;field:count </td>
<td>Type:count measure at view:affinity/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:competitor_query&#47;field:count </td>
<td>Type:count measure at view:competitor_query/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:distribution_centers&#47;field:count </td>
<td>Type:count measure at view:distribution_centers/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:events&#47;field:count </td>
<td>Type:count measure at view:events/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:ga_sessions_base&#47;field:session_count </td>
<td>Type:count measure at view:ga_sessions_base/field:session_count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:ga_sessions_base&#47;field:total_visitors </td>
<td>Type:count measure at view:ga_sessions_base/field:total_visitors does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:hits_base&#47;field:count </td>
<td>Type:count measure at view:hits_base/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:inventory_items&#47;field:count </td>
<td>Type:count measure at view:inventory_items/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:products&#47;field:count </td>
<td>Type:count measure at view:products/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:order_items_repurchase_facts&#47;field:count </td>
<td>Type:count measure at view:order_items_repurchase_facts/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:sessions&#47;field:count </td>
<td>Type:count measure at view:sessions/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:sessions&#47;field:all_sessions </td>
<td>Type:count measure at view:sessions/field:all_sessions does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:interval_windows&#47;field:count </td>
<td>Type:count measure at view:interval_windows/field:count does not have a filter applied</td>
</tr>
<tr>
<td>⛔</td>
<td>view:users&#47;field:count </td>
<td>Type:count measure at view:users/field:count does not have a filter applied</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#f4">F4</a>. Description or hidden (452⚠️)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⚠️</td>
<td>view:affinity&#47;field:product_a_id </td>
<td>view:affinity/field:product_a_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:affinity&#47;field:product_b_id </td>
<td>view:affinity/field:product_b_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:affinity&#47;field:count </td>
<td>view:affinity/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:affinity&#47;field:combined_affinity </td>
<td>view:affinity/field:combined_affinity is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_product&#47;field:user_id </td>
<td>view:user_order_product/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_product&#47;field:prod_id </td>
<td>view:user_order_product/field:prod_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_product&#47;field:order_id </td>
<td>view:user_order_product/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:total_order_product&#47;field:prod_id </td>
<td>view:total_order_product/field:prod_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:total_order_product&#47;field:prod_freq </td>
<td>view:total_order_product/field:prod_freq is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:rank </td>
<td>view:competitor_query/field:rank is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:orders_diff </td>
<td>view:competitor_query/field:orders_diff is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:brand </td>
<td>view:competitor_query/field:brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:competitor_total </td>
<td>view:competitor_query/field:competitor_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:own_brand_total </td>
<td>view:competitor_query/field:own_brand_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:competitor_query&#47;field:count </td>
<td>view:competitor_query/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:dummy_measures&#47;field:revenue </td>
<td>view:dummy_measures/field:revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:normal_dt_without_filter&#47;field:week_name </td>
<td>view:normal_dt_without_filter/field:week_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:normal_dt_without_filter&#47;field:week_number </td>
<td>view:normal_dt_without_filter/field:week_number is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:custom_filter_suggestions&#47;field:week_name_filtered </td>
<td>view:custom_filter_suggestions/field:week_name_filtered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:date </td>
<td>view:active_users/field:date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:user_id </td>
<td>view:active_users/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:days_since_last_action </td>
<td>view:active_users/field:days_since_last_action is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:active_this_day </td>
<td>view:active_users/field:active_this_day is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:active_last_7_days </td>
<td>view:active_users/field:active_last_7_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:user_count_active_30_days </td>
<td>view:active_users/field:user_count_active_30_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:user_count_active_this_day </td>
<td>view:active_users/field:user_count_active_this_day is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:active_users&#47;field:user_count_active_7_days </td>
<td>view:active_users/field:user_count_active_7_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:id </td>
<td>view:distribution_centers/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:latitude </td>
<td>view:distribution_centers/field:latitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:longitude </td>
<td>view:distribution_centers/field:longitude is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:name </td>
<td>view:distribution_centers/field:name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:distribution_centers&#47;field:count </td>
<td>view:distribution_centers/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events_top_10&#47;field:email </td>
<td>view:events_top_10/field:email is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events_top_10&#47;field:count </td>
<td>view:events_top_10/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events_top_10&#47;field:combined_filter </td>
<td>view:events_top_10/field:combined_filter is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:event_id </td>
<td>view:events/field:event_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:ip </td>
<td>view:events/field:ip is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:user_id </td>
<td>view:events/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:full_page_url </td>
<td>view:events/field:full_page_url is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:viewed_product_id </td>
<td>view:events/field:viewed_product_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:event_type </td>
<td>view:events/field:event_type is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:location </td>
<td>view:events/field:location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:approx_location </td>
<td>view:events/field:approx_location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:browser </td>
<td>view:events/field:browser is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:os </td>
<td>view:events/field:os is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:count </td>
<td>view:events/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:events&#47;field:sessions_count </td>
<td>view:events/field:sessions_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:partition_date </td>
<td>view:ga_sessions_base/field:partition_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:id </td>
<td>view:ga_sessions_base/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:visitorId </td>
<td>view:ga_sessions_base/field:visitorId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:first_time_visitor </td>
<td>view:ga_sessions_base/field:first_time_visitor is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:visitnumbertier </td>
<td>view:ga_sessions_base/field:visitnumbertier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:visitId </td>
<td>view:ga_sessions_base/field:visitId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:fullVisitorId </td>
<td>view:ga_sessions_base/field:fullVisitorId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:socialEngagementType </td>
<td>view:ga_sessions_base/field:socialEngagementType is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:userid </td>
<td>view:ga_sessions_base/field:userid is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:channelGrouping </td>
<td>view:ga_sessions_base/field:channelGrouping is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:session_count </td>
<td>view:ga_sessions_base/field:session_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:unique_visitors </td>
<td>view:ga_sessions_base/field:unique_visitors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:average_sessions_ver_visitor </td>
<td>view:ga_sessions_base/field:average_sessions_ver_visitor is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:total_visitors </td>
<td>view:ga_sessions_base/field:total_visitors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:first_time_visitors </td>
<td>view:ga_sessions_base/field:first_time_visitors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:second_time_visitors </td>
<td>view:ga_sessions_base/field:second_time_visitors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:ga_sessions_base&#47;field:returning_visitors </td>
<td>view:ga_sessions_base/field:returning_visitors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:continent </td>
<td>view:geoNetwork_base/field:continent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:subcontinent </td>
<td>view:geoNetwork_base/field:subcontinent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:country </td>
<td>view:geoNetwork_base/field:country is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:region </td>
<td>view:geoNetwork_base/field:region is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:metro </td>
<td>view:geoNetwork_base/field:metro is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:city </td>
<td>view:geoNetwork_base/field:city is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:cityid </td>
<td>view:geoNetwork_base/field:cityid is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:networkDomain </td>
<td>view:geoNetwork_base/field:networkDomain is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:networkLocation </td>
<td>view:geoNetwork_base/field:networkLocation is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:location </td>
<td>view:geoNetwork_base/field:location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:geoNetwork_base&#47;field:approximate_networkLocation </td>
<td>view:geoNetwork_base/field:approximate_networkLocation is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:timeonsite_tier </td>
<td>view:totals_base/field:timeonsite_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:timeOnScreen_total_unique </td>
<td>view:totals_base/field:timeOnScreen_total_unique is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:visits_total </td>
<td>view:totals_base/field:visits_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:hits_total </td>
<td>view:totals_base/field:hits_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:hits_average_per_session </td>
<td>view:totals_base/field:hits_average_per_session is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:pageviews_total </td>
<td>view:totals_base/field:pageviews_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:timeonsite_total </td>
<td>view:totals_base/field:timeonsite_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:timeonsite_average_per_session </td>
<td>view:totals_base/field:timeonsite_average_per_session is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:page_views_session </td>
<td>view:totals_base/field:page_views_session is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:bounces_total </td>
<td>view:totals_base/field:bounces_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:bounce_rate </td>
<td>view:totals_base/field:bounce_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:transactions_count </td>
<td>view:totals_base/field:transactions_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:transactionRevenue_total </td>
<td>view:totals_base/field:transactionRevenue_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:newVisits_total </td>
<td>view:totals_base/field:newVisits_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:screenViews_total </td>
<td>view:totals_base/field:screenViews_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:timeOnScreen_total </td>
<td>view:totals_base/field:timeOnScreen_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:totals_base&#47;field:uniqueScreenViews_total </td>
<td>view:totals_base/field:uniqueScreenViews_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:addContent </td>
<td>view:trafficSource_base/field:addContent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:referralPath </td>
<td>view:trafficSource_base/field:referralPath is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:campaign </td>
<td>view:trafficSource_base/field:campaign is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:source </td>
<td>view:trafficSource_base/field:source is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:medium </td>
<td>view:trafficSource_base/field:medium is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:keyword </td>
<td>view:trafficSource_base/field:keyword is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:adContent </td>
<td>view:trafficSource_base/field:adContent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:source_list </td>
<td>view:trafficSource_base/field:source_list is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:source_count </td>
<td>view:trafficSource_base/field:source_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trafficSource_base&#47;field:keyword_count </td>
<td>view:trafficSource_base/field:keyword_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:campaignId </td>
<td>view:adwordsClickInfo_base/field:campaignId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:adGroupId </td>
<td>view:adwordsClickInfo_base/field:adGroupId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:creativeId </td>
<td>view:adwordsClickInfo_base/field:creativeId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:criteriaId </td>
<td>view:adwordsClickInfo_base/field:criteriaId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:page </td>
<td>view:adwordsClickInfo_base/field:page is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:slot </td>
<td>view:adwordsClickInfo_base/field:slot is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:criteriaParameters </td>
<td>view:adwordsClickInfo_base/field:criteriaParameters is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:gclId </td>
<td>view:adwordsClickInfo_base/field:gclId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:customerId </td>
<td>view:adwordsClickInfo_base/field:customerId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:adNetworkType </td>
<td>view:adwordsClickInfo_base/field:adNetworkType is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:targetingCriteria </td>
<td>view:adwordsClickInfo_base/field:targetingCriteria is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:adwordsClickInfo_base&#47;field:isVideoAd </td>
<td>view:adwordsClickInfo_base/field:isVideoAd is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:browser </td>
<td>view:device_base/field:browser is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:browserVersion </td>
<td>view:device_base/field:browserVersion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:operatingSystem </td>
<td>view:device_base/field:operatingSystem is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:operatingSystemVersion </td>
<td>view:device_base/field:operatingSystemVersion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:isMobile </td>
<td>view:device_base/field:isMobile is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:flashVersion </td>
<td>view:device_base/field:flashVersion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:javaEnabled </td>
<td>view:device_base/field:javaEnabled is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:language </td>
<td>view:device_base/field:language is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:screenColors </td>
<td>view:device_base/field:screenColors is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:screenResolution </td>
<td>view:device_base/field:screenResolution is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:mobileDeviceBranding </td>
<td>view:device_base/field:mobileDeviceBranding is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:mobileDeviceInfo </td>
<td>view:device_base/field:mobileDeviceInfo is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:mobileDeviceMarketingName </td>
<td>view:device_base/field:mobileDeviceMarketingName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:mobileDeviceModel </td>
<td>view:device_base/field:mobileDeviceModel is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:device_base&#47;field:mobileDeviceInputSelector </td>
<td>view:device_base/field:mobileDeviceInputSelector is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:id </td>
<td>view:hits_base/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:hitNumber </td>
<td>view:hits_base/field:hitNumber is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:time </td>
<td>view:hits_base/field:time is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:hour </td>
<td>view:hits_base/field:hour is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:minute </td>
<td>view:hits_base/field:minute is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:isSecure </td>
<td>view:hits_base/field:isSecure is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:isiInteraction </td>
<td>view:hits_base/field:isiInteraction is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:referer </td>
<td>view:hits_base/field:referer is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_base&#47;field:count </td>
<td>view:hits_base/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_page_base&#47;field:pagePath </td>
<td>view:hits_page_base/field:pagePath is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_page_base&#47;field:hostName </td>
<td>view:hits_page_base/field:hostName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_page_base&#47;field:pageTitle </td>
<td>view:hits_page_base/field:pageTitle is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_page_base&#47;field:searchKeyword </td>
<td>view:hits_page_base/field:searchKeyword is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_page_base&#47;field:searchCategory </td>
<td>view:hits_page_base/field:searchCategory is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:id </td>
<td>view:hits_transaction_base/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:transactionShipping </td>
<td>view:hits_transaction_base/field:transactionShipping is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:affiliation </td>
<td>view:hits_transaction_base/field:affiliation is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:curencyCode </td>
<td>view:hits_transaction_base/field:curencyCode is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:localTransactionRevenue </td>
<td>view:hits_transaction_base/field:localTransactionRevenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:localTransactionTax </td>
<td>view:hits_transaction_base/field:localTransactionTax is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_transaction_base&#47;field:localTransactionShipping </td>
<td>view:hits_transaction_base/field:localTransactionShipping is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:id </td>
<td>view:hits_item_base/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:transactionId </td>
<td>view:hits_item_base/field:transactionId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:productName </td>
<td>view:hits_item_base/field:productName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:productCategory </td>
<td>view:hits_item_base/field:productCategory is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:productSku </td>
<td>view:hits_item_base/field:productSku is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:curencyCode </td>
<td>view:hits_item_base/field:curencyCode is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_item_base&#47;field:product_count </td>
<td>view:hits_item_base/field:product_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialInteractionNetwork </td>
<td>view:hits_social_base/field:socialInteractionNetwork is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialInteractionAction </td>
<td>view:hits_social_base/field:socialInteractionAction is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialInteractions </td>
<td>view:hits_social_base/field:socialInteractions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialInteractionTarget </td>
<td>view:hits_social_base/field:socialInteractionTarget is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialNetwork </td>
<td>view:hits_social_base/field:socialNetwork is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:uniqueSocialInteractions </td>
<td>view:hits_social_base/field:uniqueSocialInteractions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:hasSocialSourceReferral </td>
<td>view:hits_social_base/field:hasSocialSourceReferral is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_social_base&#47;field:socialInteractionNetworkAction </td>
<td>view:hits_social_base/field:socialInteractionNetworkAction is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpClicks </td>
<td>view:hits_publisher_base/field:dfpClicks is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpImpressions </td>
<td>view:hits_publisher_base/field:dfpImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpMatchedQueries </td>
<td>view:hits_publisher_base/field:dfpMatchedQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpMeasurableImpressions </td>
<td>view:hits_publisher_base/field:dfpMeasurableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpQueries </td>
<td>view:hits_publisher_base/field:dfpQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpRevenueCpm </td>
<td>view:hits_publisher_base/field:dfpRevenueCpm is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpRevenueCpc </td>
<td>view:hits_publisher_base/field:dfpRevenueCpc is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpViewableImpressions </td>
<td>view:hits_publisher_base/field:dfpViewableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpPagesViewed </td>
<td>view:hits_publisher_base/field:dfpPagesViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpClicks </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpClicks is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpImpressions </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpMatchedQueries </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpMatchedQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpMeasurableImpressions </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpMeasurableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpQueries </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpRevenueCpm </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpRevenueCpm is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpRevenueCpc </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpRevenueCpc is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpViewableImpressions </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpViewableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsenseBackfillDfpPagesViewed </td>
<td>view:hits_publisher_base/field:adsenseBackfillDfpPagesViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpClicks </td>
<td>view:hits_publisher_base/field:adxBackfillDfpClicks is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpImpressions </td>
<td>view:hits_publisher_base/field:adxBackfillDfpImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpMatchedQueries </td>
<td>view:hits_publisher_base/field:adxBackfillDfpMatchedQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpMeasurableImpressions </td>
<td>view:hits_publisher_base/field:adxBackfillDfpMeasurableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpQueries </td>
<td>view:hits_publisher_base/field:adxBackfillDfpQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpRevenueCpm </td>
<td>view:hits_publisher_base/field:adxBackfillDfpRevenueCpm is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpRevenueCpc </td>
<td>view:hits_publisher_base/field:adxBackfillDfpRevenueCpc is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpViewableImpressions </td>
<td>view:hits_publisher_base/field:adxBackfillDfpViewableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxBackfillDfpPagesViewed </td>
<td>view:hits_publisher_base/field:adxBackfillDfpPagesViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxClicks </td>
<td>view:hits_publisher_base/field:adxClicks is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxImpressions </td>
<td>view:hits_publisher_base/field:adxImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxMatchedQueries </td>
<td>view:hits_publisher_base/field:adxMatchedQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxMeasurableImpressions </td>
<td>view:hits_publisher_base/field:adxMeasurableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxQueries </td>
<td>view:hits_publisher_base/field:adxQueries is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxRevenue </td>
<td>view:hits_publisher_base/field:adxRevenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxViewableImpressions </td>
<td>view:hits_publisher_base/field:adxViewableImpressions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adxPagesViewed </td>
<td>view:hits_publisher_base/field:adxPagesViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsViewed </td>
<td>view:hits_publisher_base/field:adsViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsUnitsViewed </td>
<td>view:hits_publisher_base/field:adsUnitsViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsUnitsMatched </td>
<td>view:hits_publisher_base/field:adsUnitsMatched is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:viewableAdsViewed </td>
<td>view:hits_publisher_base/field:viewableAdsViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:measurableAdsViewed </td>
<td>view:hits_publisher_base/field:measurableAdsViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsPagesViewed </td>
<td>view:hits_publisher_base/field:adsPagesViewed is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsClicked </td>
<td>view:hits_publisher_base/field:adsClicked is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:adsRevenue </td>
<td>view:hits_publisher_base/field:adsRevenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpAdGroup </td>
<td>view:hits_publisher_base/field:dfpAdGroup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpAdUnits </td>
<td>view:hits_publisher_base/field:dfpAdUnits is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_publisher_base&#47;field:dfpNetworkId </td>
<td>view:hits_publisher_base/field:dfpNetworkId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:name </td>
<td>view:hits_appInfo_base/field:name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:version </td>
<td>view:hits_appInfo_base/field:version is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:id </td>
<td>view:hits_appInfo_base/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:installerId </td>
<td>view:hits_appInfo_base/field:installerId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:appInstallerId </td>
<td>view:hits_appInfo_base/field:appInstallerId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:appName </td>
<td>view:hits_appInfo_base/field:appName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:appVersion </td>
<td>view:hits_appInfo_base/field:appVersion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:appId </td>
<td>view:hits_appInfo_base/field:appId is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:screenName </td>
<td>view:hits_appInfo_base/field:screenName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:landingScreenName </td>
<td>view:hits_appInfo_base/field:landingScreenName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:exitScreenName </td>
<td>view:hits_appInfo_base/field:exitScreenName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_appInfo_base&#47;field:screenDepth </td>
<td>view:hits_appInfo_base/field:screenDepth is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:contentInfo_base&#47;field:contentDescription </td>
<td>view:contentInfo_base/field:contentDescription is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customDimensions_base&#47;field:index </td>
<td>view:hits_customDimensions_base/field:index is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customDimensions_base&#47;field:value </td>
<td>view:hits_customDimensions_base/field:value is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customMetrics_base&#47;field:index </td>
<td>view:hits_customMetrics_base/field:index is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customMetrics_base&#47;field:value </td>
<td>view:hits_customMetrics_base/field:value is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customVariables_base&#47;field:customVarName </td>
<td>view:hits_customVariables_base/field:customVarName is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customVariables_base&#47;field:customVarValue </td>
<td>view:hits_customVariables_base/field:customVarValue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_customVariables_base&#47;field:index </td>
<td>view:hits_customVariables_base/field:index is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eCommerceAction_base&#47;field:action_type </td>
<td>view:hits_eCommerceAction_base/field:action_type is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eCommerceAction_base&#47;field:option </td>
<td>view:hits_eCommerceAction_base/field:option is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eCommerceAction_base&#47;field:step </td>
<td>view:hits_eCommerceAction_base/field:step is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eventInfo_base&#47;field:eventCategory </td>
<td>view:hits_eventInfo_base/field:eventCategory is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eventInfo_base&#47;field:eventAction </td>
<td>view:hits_eventInfo_base/field:eventAction is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eventInfo_base&#47;field:eventLabel </td>
<td>view:hits_eventInfo_base/field:eventLabel is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eventInfo_base&#47;field:eventValue </td>
<td>view:hits_eventInfo_base/field:eventValue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:hits_eventInfo&#47;field:play </td>
<td>view:hits_eventInfo/field:play is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:histogram_equalisation&#47;field:ntile </td>
<td>view:histogram_equalisation/field:ntile is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:histogram_equalisation&#47;field:cohort </td>
<td>view:histogram_equalisation/field:cohort is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:histogram_equalisation&#47;field:revenue </td>
<td>view:histogram_equalisation/field:revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:histogram_equalisation&#47;field:total_orders </td>
<td>view:histogram_equalisation/field:total_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:id </td>
<td>view:inventory_items/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:cost </td>
<td>view:inventory_items/field:cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:is_sold </td>
<td>view:inventory_items/field:is_sold is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:days_in_inventory_tier </td>
<td>view:inventory_items/field:days_in_inventory_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:days_since_arrival_tier </td>
<td>view:inventory_items/field:days_since_arrival_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:sold_count </td>
<td>view:inventory_items/field:sold_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:sold_percent </td>
<td>view:inventory_items/field:sold_percent is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:total_cost </td>
<td>view:inventory_items/field:total_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:average_cost </td>
<td>view:inventory_items/field:average_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:count </td>
<td>view:inventory_items/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_items&#47;field:number_on_hand </td>
<td>view:inventory_items/field:number_on_hand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:product_id </td>
<td>view:inventory_snapshot/field:product_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:snapshot_date </td>
<td>view:inventory_snapshot/field:snapshot_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:total_in_stock </td>
<td>view:inventory_snapshot/field:total_in_stock is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio </td>
<td>view:inventory_snapshot/field:stock_coverage_ratio is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_yday </td>
<td>view:inventory_snapshot/field:stock_coverage_ratio_yday is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:stock_coverage_ratio_last_wk </td>
<td>view:inventory_snapshot/field:stock_coverage_ratio_last_wk is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:inventory_snapshot&#47;field:wk_to_wk_change_coverage </td>
<td>view:inventory_snapshot/field:wk_to_wk_change_coverage is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:overview_dynamic_dimension_title </td>
<td>view:labels/field:overview_dynamic_dimension_title is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:curent_period_name </td>
<td>view:labels/field:curent_period_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:previous_period_name </td>
<td>view:labels/field:previous_period_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:first_text </td>
<td>view:labels/field:first_text is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:second_text </td>
<td>view:labels/field:second_text is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:first_text_size </td>
<td>view:labels/field:first_text_size is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:second_text_size </td>
<td>view:labels/field:second_text_size is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:labels&#47;field:notbold </td>
<td>view:labels/field:notbold is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:items_in_order </td>
<td>view:order_facts/field:items_in_order is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:order_amount </td>
<td>view:order_facts/field:order_amount is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:order_cost </td>
<td>view:order_facts/field:order_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:order_gross_margin </td>
<td>view:order_facts/field:order_gross_margin is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:order_sequence_number </td>
<td>view:order_facts/field:order_sequence_number is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_facts&#47;field:is_first_purchase </td>
<td>view:order_facts/field:is_first_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:brand </td>
<td>view:order_items/field:brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:id </td>
<td>view:order_items/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:user_id </td>
<td>view:order_items/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:user_id_evens </td>
<td>view:order_items/field:user_id_evens is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:order_id </td>
<td>view:order_items/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:date_breakdown </td>
<td>view:order_items/field:date_breakdown is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:reporting_period </td>
<td>view:order_items/field:reporting_period is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:months_since_signup </td>
<td>view:order_items/field:months_since_signup is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:status </td>
<td>view:order_items/field:status is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:days_to_process </td>
<td>view:order_items/field:days_to_process is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:shipping_time </td>
<td>view:order_items/field:shipping_time is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:sale_price </td>
<td>view:order_items/field:sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:gross_margin </td>
<td>view:order_items/field:gross_margin is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:item_gross_margin_percentage </td>
<td>view:order_items/field:item_gross_margin_percentage is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:item_gross_margin_percentage_tier </td>
<td>view:order_items/field:item_gross_margin_percentage_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:is_returned </td>
<td>view:order_items/field:is_returned is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:days_until_next_order </td>
<td>view:order_items/field:days_until_next_order is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:repeat_orders_within_30d </td>
<td>view:order_items/field:repeat_orders_within_30d is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count </td>
<td>view:order_items/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:order_count </td>
<td>view:order_items/field:order_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_days_to_process </td>
<td>view:order_items/field:average_days_to_process is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_shipping_time </td>
<td>view:order_items/field:average_shipping_time is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:item_gross_margin_perc </td>
<td>view:order_items/field:item_gross_margin_perc is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:dynamic_metric </td>
<td>view:order_items/field:dynamic_metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:dynamic_metric_1 </td>
<td>view:order_items/field:dynamic_metric_1 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:dynamic_metric_2 </td>
<td>view:order_items/field:dynamic_metric_2 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:total_sale_price </td>
<td>view:order_items/field:total_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:total_gross_margin </td>
<td>view:order_items/field:total_gross_margin is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_sale_price </td>
<td>view:order_items/field:average_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:median_sale_price </td>
<td>view:order_items/field:median_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_gross_margin </td>
<td>view:order_items/field:average_gross_margin is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:total_gross_margin_percentage </td>
<td>view:order_items/field:total_gross_margin_percentage is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:average_spend_per_user </td>
<td>view:order_items/field:average_spend_per_user is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:returned_count </td>
<td>view:order_items/field:returned_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:returned_total_sale_price </td>
<td>view:order_items/field:returned_total_sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:test_rate </td>
<td>view:order_items/field:test_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:return_rate </td>
<td>view:order_items/field:return_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:returned_passthrough </td>
<td>view:order_items/field:returned_passthrough is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:count_with_repeat_purchase_within_30d </td>
<td>view:order_items/field:count_with_repeat_purchase_within_30d is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:first_purchase_count </td>
<td>view:order_items/field:first_purchase_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:cohort_values_0 </td>
<td>view:order_items/field:cohort_values_0 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:product_brand_filter </td>
<td>view:order_items/field:product_brand_filter is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:text_search_string </td>
<td>view:order_items/field:text_search_string is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:date_granularity </td>
<td>view:order_items/field:date_granularity is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric_selector </td>
<td>view:order_items/field:metric_selector is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric_selector_1 </td>
<td>view:order_items/field:metric_selector_1 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric_selector_2 </td>
<td>view:order_items/field:metric_selector_2 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:sales_cost </td>
<td>view:order_items/field:sales_cost is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items&#47;field:metric </td>
<td>view:order_items/field:metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:pop_order_items_base&#47;field:agg_1 </td>
<td>view:pop_order_items_base/field:agg_1 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:pop_order_items_base&#47;field:agg_2 </td>
<td>view:pop_order_items_base/field:agg_2 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:pop_order_items_base&#47;field:sale_price </td>
<td>view:pop_order_items_base/field:sale_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:pop&#47;field:reference_date_formatted </td>
<td>view:pop/field:reference_date_formatted is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:pop&#47;field:date_filter </td>
<td>view:pop/field:date_filter is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:id </td>
<td>view:products/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:test_dimension </td>
<td>view:products/field:test_dimension is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:category </td>
<td>view:products/field:category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:item_name </td>
<td>view:products/field:item_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:brand </td>
<td>view:products/field:brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:retail_price </td>
<td>view:products/field:retail_price is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:department </td>
<td>view:products/field:department is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:sku </td>
<td>view:products/field:sku is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:distribution_center_id </td>
<td>view:products/field:distribution_center_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:count </td>
<td>view:products/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:brand_count </td>
<td>view:products/field:brand_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:category_count </td>
<td>view:products/field:category_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:department_count </td>
<td>view:products/field:department_count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:metric </td>
<td>view:products/field:metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:products&#47;field:header_name </td>
<td>view:products/field:header_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:repeat_purchase_facts&#47;field:has_subsequent_order </td>
<td>view:repeat_purchase_facts/field:has_subsequent_order is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:repeat_purchase_facts&#47;field:number_subsequent_orders </td>
<td>view:repeat_purchase_facts/field:number_subsequent_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:category </td>
<td>view:order_items_repurchase_facts/field:category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:lifetime_orders_tier </td>
<td>view:order_items_repurchase_facts/field:lifetime_orders_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:order_id </td>
<td>view:order_items_repurchase_facts/field:order_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:order_sequence_number </td>
<td>view:order_items_repurchase_facts/field:order_sequence_number is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_gap </td>
<td>view:order_items_repurchase_facts/field:repurchase_gap is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_tier </td>
<td>view:order_items_repurchase_facts/field:repurchase_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:days_since_first_order </td>
<td>view:order_items_repurchase_facts/field:days_since_first_order is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:days_since_first_order_tier </td>
<td>view:order_items_repurchase_facts/field:days_since_first_order_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_30_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_30_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_60_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_60_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_90_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_90_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_120_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_120_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_150_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_150_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_repurchases_first_180_days </td>
<td>view:order_items_repurchase_facts/field:count_repurchases_first_180_days is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_30 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_30 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_60 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_60 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_90 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_90 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_120 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_120 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_150 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_150 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:repurchase_rate_180 </td>
<td>view:order_items_repurchase_facts/field:repurchase_rate_180 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_customers </td>
<td>view:order_items_repurchase_facts/field:count_customers is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:count_orders </td>
<td>view:order_items_repurchase_facts/field:count_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:percent_of_customers </td>
<td>view:order_items_repurchase_facts/field:percent_of_customers is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_repurchase_facts&#47;field:product_category </td>
<td>view:order_items_repurchase_facts/field:product_category is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:session_id </td>
<td>view:sessions/field:session_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:session_user_id </td>
<td>view:sessions/field:session_user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:landing_event_id </td>
<td>view:sessions/field:landing_event_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:bounce_event_id </td>
<td>view:sessions/field:bounce_event_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:duration </td>
<td>view:sessions/field:duration is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:duration_seconds_tier </td>
<td>view:sessions/field:duration_seconds_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:is_bounce_session </td>
<td>view:sessions/field:is_bounce_session is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:includes_browse </td>
<td>view:sessions/field:includes_browse is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:includes_product </td>
<td>view:sessions/field:includes_product is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:includes_cart </td>
<td>view:sessions/field:includes_cart is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:includes_purchase </td>
<td>view:sessions/field:includes_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:number_of_events_in_session </td>
<td>view:sessions/field:number_of_events_in_session is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:furthest_funnel_step </td>
<td>view:sessions/field:furthest_funnel_step is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count </td>
<td>view:sessions/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:average_duration </td>
<td>view:sessions/field:average_duration is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_bounce_sessions </td>
<td>view:sessions/field:count_bounce_sessions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:percent_bounce_sessions </td>
<td>view:sessions/field:percent_bounce_sessions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_with_cart </td>
<td>view:sessions/field:count_with_cart is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_with_purchase </td>
<td>view:sessions/field:count_with_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:all_sessions </td>
<td>view:sessions/field:all_sessions is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_browse_or_later </td>
<td>view:sessions/field:count_browse_or_later is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_product_or_later </td>
<td>view:sessions/field:count_product_or_later is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_cart_or_later </td>
<td>view:sessions/field:count_cart_or_later is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:count_purchase </td>
<td>view:sessions/field:count_purchase is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:cart_to_checkout_conversion </td>
<td>view:sessions/field:cart_to_checkout_conversion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:sessions&#47;field:overall_conversion </td>
<td>view:sessions/field:overall_conversion is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:total_sale_price_brand_v2 </td>
<td>view:order_items_share_of_wallet/field:total_sale_price_brand_v2 is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:item_name </td>
<td>view:order_items_share_of_wallet/field:item_name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:order_items_share_of_wallet&#47;field:brand </td>
<td>view:order_items_share_of_wallet/field:brand is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:user_reactivation_rate </td>
<td>view:parameter_intervals/field:user_reactivation_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:user_activation_rate </td>
<td>view:parameter_intervals/field:user_activation_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:user_retention_rate </td>
<td>view:parameter_intervals/field:user_retention_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:total_active_users </td>
<td>view:parameter_intervals/field:total_active_users is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:days_user_active </td>
<td>view:parameter_intervals/field:days_user_active is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:parameter_intervals&#47;field:time_interval_range </td>
<td>view:parameter_intervals/field:time_interval_range is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:start </td>
<td>view:user_growth/field:start is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:end_time </td>
<td>view:user_growth/field:end_time is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:user_id </td>
<td>view:user_growth/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:user_activation_rate </td>
<td>view:user_growth/field:user_activation_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:user_retention_rate </td>
<td>view:user_growth/field:user_retention_rate is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_growth&#47;field:total_active_users </td>
<td>view:user_growth/field:total_active_users is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:interval_windows&#47;field:user_id </td>
<td>view:interval_windows/field:user_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:interval_windows&#47;field:count </td>
<td>view:interval_windows/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trailing_sales_snapshot&#47;field:product_id </td>
<td>view:trailing_sales_snapshot/field:product_id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trailing_sales_snapshot&#47;field:snapshot_date </td>
<td>view:trailing_sales_snapshot/field:snapshot_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:trailing_sales_snapshot&#47;field:sum_trailing_28d_sales </td>
<td>view:trailing_sales_snapshot/field:sum_trailing_28d_sales is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:transposed_measures&#47;field:measures_as_rows </td>
<td>view:transposed_measures/field:measures_as_rows is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:transposed_measures&#47;field:order_date </td>
<td>view:transposed_measures/field:order_date is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:transposed_measures&#47;field:consolidated_metric </td>
<td>view:transposed_measures/field:consolidated_metric is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:days_as_customer_tiered </td>
<td>view:user_order_facts/field:days_as_customer_tiered is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:lifetime_orders </td>
<td>view:user_order_facts/field:lifetime_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:lifetime_orders_tier </td>
<td>view:user_order_facts/field:lifetime_orders_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:distinct_months_with_orders </td>
<td>view:user_order_facts/field:distinct_months_with_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:lifetime_revenue </td>
<td>view:user_order_facts/field:lifetime_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:lifetime_revenue_tier </td>
<td>view:user_order_facts/field:lifetime_revenue_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:average_lifetime_orders </td>
<td>view:user_order_facts/field:average_lifetime_orders is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:user_order_facts&#47;field:average_lifetime_revenue </td>
<td>view:user_order_facts/field:average_lifetime_revenue is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:id </td>
<td>view:users/field:id is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:case_when_test_delete </td>
<td>view:users/field:case_when_test_delete is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:name </td>
<td>view:users/field:name is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:age </td>
<td>view:users/field:age is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:age_tier </td>
<td>view:users/field:age_tier is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:gender </td>
<td>view:users/field:gender is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:gender_short </td>
<td>view:users/field:gender_short is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:user_image </td>
<td>view:users/field:user_image is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:email </td>
<td>view:users/field:email is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:city </td>
<td>view:users/field:city is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:state </td>
<td>view:users/field:state is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:zip </td>
<td>view:users/field:zip is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:uk_postcode </td>
<td>view:users/field:uk_postcode is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:country </td>
<td>view:users/field:country is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:location </td>
<td>view:users/field:location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:approx_location </td>
<td>view:users/field:approx_location is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:history </td>
<td>view:users/field:history is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:traffic_source </td>
<td>view:users/field:traffic_source is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:count </td>
<td>view:users/field:count is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:count_percent_of_total </td>
<td>view:users/field:count_percent_of_total is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:average_age </td>
<td>view:users/field:average_age is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:user_id_selector </td>
<td>view:users/field:user_id_selector is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:test </td>
<td>view:users/field:test is missing a description</td>
</tr>
<tr>
<td>⚠️</td>
<td>view:users&#47;field:adding_to_some_measure </td>
<td>view:users/field:adding_to_some_measure is missing a description</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#k1">K1</a>. Primary keys required (52⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view: affinity </td>
<td>No Primary Key Dimensions found in affinity</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_order_product </td>
<td>No Primary Key Dimensions found in user_order_product</td>
</tr>
<tr>
<td>⛔</td>
<td>view: total_order_product </td>
<td>No Primary Key Dimensions found in total_order_product</td>
</tr>
<tr>
<td>⛔</td>
<td>view: competitor_query </td>
<td>No Primary Key Dimensions found in competitor_query</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dummy_measures </td>
<td>No Primary Key Dimensions found in dummy_measures</td>
</tr>
<tr>
<td>⛔</td>
<td>view: normal_dt_without_filter </td>
<td>No Primary Key Dimensions found in normal_dt_without_filter</td>
</tr>
<tr>
<td>⛔</td>
<td>view: custom_filter_suggestions </td>
<td>No Primary Key Dimensions found in custom_filter_suggestions</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dates </td>
<td>No Primary Key Dimensions found in dates</td>
</tr>
<tr>
<td>⛔</td>
<td>view: active_users </td>
<td>No Primary Key Dimensions found in active_users</td>
</tr>
<tr>
<td>⛔</td>
<td>view: distribution_centers </td>
<td>No Primary Key Dimensions found in distribution_centers</td>
</tr>
<tr>
<td>⛔</td>
<td>view: dynamic_text_tile </td>
<td>No Primary Key Dimensions found in dynamic_text_tile</td>
</tr>
<tr>
<td>⛔</td>
<td>view: events_top_10 </td>
<td>No Primary Key Dimensions found in events_top_10</td>
</tr>
<tr>
<td>⛔</td>
<td>view: events </td>
<td>No Primary Key Dimensions found in events</td>
</tr>
<tr>
<td>⛔</td>
<td>view: ga_sessions </td>
<td>No Primary Key Dimensions found in ga_sessions</td>
</tr>
<tr>
<td>⛔</td>
<td>view: geoNetwork </td>
<td>No Primary Key Dimensions found in geoNetwork</td>
</tr>
<tr>
<td>⛔</td>
<td>view: totals </td>
<td>No Primary Key Dimensions found in totals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: trafficSource </td>
<td>No Primary Key Dimensions found in trafficSource</td>
</tr>
<tr>
<td>⛔</td>
<td>view: device </td>
<td>No Primary Key Dimensions found in device</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits </td>
<td>No Primary Key Dimensions found in hits</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_page </td>
<td>No Primary Key Dimensions found in hits_page</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_item </td>
<td>No Primary Key Dimensions found in hits_item</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_social </td>
<td>No Primary Key Dimensions found in hits_social</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_appInfo </td>
<td>No Primary Key Dimensions found in hits_appInfo</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_eventInfo </td>
<td>No Primary Key Dimensions found in hits_eventInfo</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_customDimensions </td>
<td>No Primary Key Dimensions found in hits_customDimensions</td>
</tr>
<tr>
<td>⛔</td>
<td>view: hits_customVariables </td>
<td>No Primary Key Dimensions found in hits_customVariables</td>
</tr>
<tr>
<td>⛔</td>
<td>view: histogram_equalisation </td>
<td>No Primary Key Dimensions found in histogram_equalisation</td>
</tr>
<tr>
<td>⛔</td>
<td>view: inventory_items </td>
<td>No Primary Key Dimensions found in inventory_items</td>
</tr>
<tr>
<td>⛔</td>
<td>view: inventory_snapshot </td>
<td>No Primary Key Dimensions found in inventory_snapshot</td>
</tr>
<tr>
<td>⛔</td>
<td>view: labels </td>
<td>No Primary Key Dimensions found in labels</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_facts </td>
<td>No Primary Key Dimensions found in order_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_brand_by_date </td>
<td>No Primary Key Dimensions found in order_items_brand_by_date</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_brand_by_month </td>
<td>No Primary Key Dimensions found in order_items_brand_by_month</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_brand_by_year </td>
<td>No Primary Key Dimensions found in order_items_brand_by_year</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items </td>
<td>No Primary Key Dimensions found in order_items</td>
</tr>
<tr>
<td>⛔</td>
<td>view: pop_order_items_created </td>
<td>No Primary Key Dimensions found in pop_order_items_created</td>
</tr>
<tr>
<td>⛔</td>
<td>view: pop_order_items_delivered </td>
<td>No Primary Key Dimensions found in pop_order_items_delivered</td>
</tr>
<tr>
<td>⛔</td>
<td>view: numbers </td>
<td>No Primary Key Dimensions found in numbers</td>
</tr>
<tr>
<td>⛔</td>
<td>view: pop </td>
<td>No Primary Key Dimensions found in pop</td>
</tr>
<tr>
<td>⛔</td>
<td>view: products </td>
<td>No Primary Key Dimensions found in products</td>
</tr>
<tr>
<td>⛔</td>
<td>view: repeat_purchase_facts </td>
<td>No Primary Key Dimensions found in repeat_purchase_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_repurchase_facts </td>
<td>No Primary Key Dimensions found in order_items_repurchase_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: sessions </td>
<td>No Primary Key Dimensions found in sessions</td>
</tr>
<tr>
<td>⛔</td>
<td>view: top_5_countries </td>
<td>No Primary Key Dimensions found in top_5_countries</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key Dimensions found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: calendar </td>
<td>No Primary Key Dimensions found in calendar</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_growth </td>
<td>No Primary Key Dimensions found in user_growth</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key Dimensions found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: trailing_sales_snapshot </td>
<td>No Primary Key Dimensions found in trailing_sales_snapshot</td>
</tr>
<tr>
<td>⛔</td>
<td>view: transposed_measures </td>
<td>No Primary Key Dimensions found in transposed_measures</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_order_facts </td>
<td>No Primary Key Dimensions found in user_order_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: users </td>
<td>No Primary Key Dimensions found in users</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#t1">T1</a>. Triggers use datagroups (3⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view: dates </td>
<td>Triggered PDTs should use datagroups or persist_for.</td>
</tr>
<tr>
<td>⛔</td>
<td>view: active_users </td>
<td>Triggered PDTs should use datagroups or persist_for.</td>
</tr>
<tr>
<td>⛔</td>
<td>view: calendar </td>
<td>Triggered PDTs should use datagroups or persist_for.</td>
</tr></tbody></table></details>
<details style="margin-left: 3em" open="open">
<summary style="margin-left:-1em;border-bottom:solid 1px #333;font-size:170%;"><a href="https://looker-open-source.github.io/look-at-me-sideways/rules.html#t2">T2</a>. Primary keys required (28⛔)</summary>

<table>
<thead><tr>
<th>Level</th>
<th>Location</th>
<th>Description</th>
</tr></thead>
<tbody>
<tr>
<td>⛔</td>
<td>view: affinity </td>
<td>No Primary Key columns/selectAliases found in affinity</td>
</tr>
<tr>
<td>⛔</td>
<td>view: affinity </td>
<td>No Primary Key columns/selectAliases found in affinity</td>
</tr>
<tr>
<td>⛔</td>
<td>view: affinity </td>
<td>No Primary Key columns/selectAliases found in affinity</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_order_product </td>
<td>No Primary Key columns/selectAliases found in user_order_product</td>
</tr>
<tr>
<td>⛔</td>
<td>view: total_order_product </td>
<td>No Primary Key columns/selectAliases found in total_order_product</td>
</tr>
<tr>
<td>⛔</td>
<td>view: competitor_query </td>
<td>No Primary Key columns/selectAliases found in competitor_query</td>
</tr>
<tr>
<td>⛔</td>
<td>view: competitor_query </td>
<td>No Primary Key columns/selectAliases found in competitor_query</td>
</tr>
<tr>
<td>⛔</td>
<td>view: histogram_equalisation </td>
<td>No Primary Key columns/selectAliases found in histogram_equalisation</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_facts </td>
<td>No Primary Key columns/selectAliases found in order_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: pop_order_items_created </td>
<td>No Primary Key columns/selectAliases found in pop_order_items_created</td>
</tr>
<tr>
<td>⛔</td>
<td>view: pop_order_items_delivered </td>
<td>No Primary Key columns/selectAliases found in pop_order_items_delivered</td>
</tr>
<tr>
<td>⛔</td>
<td>view: repeat_purchase_facts </td>
<td>No Primary Key columns/selectAliases found in repeat_purchase_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_repurchase_facts </td>
<td>No Primary Key columns/selectAliases found in order_items_repurchase_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: order_items_repurchase_facts </td>
<td>No Primary Key columns/selectAliases found in order_items_repurchase_facts</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: parameter_intervals </td>
<td>No Primary Key columns/selectAliases found in parameter_intervals</td>
</tr>
<tr>
<td>⛔</td>
<td>view: user_growth </td>
<td>No Primary Key columns/selectAliases found in user_growth</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: interval_windows </td>
<td>No Primary Key columns/selectAliases found in interval_windows</td>
</tr>
<tr>
<td>⛔</td>
<td>view: transposed_measures </td>
<td>No Primary Key columns/selectAliases found in transposed_measures</td>
</tr></tbody></table></details></details>

---

### Icon Key
<table>
<thead><tr>
<th></th>
<th>non-exempted</th>
<th>exempted</th>
</tr></thead>
<tbody>
<tr>
<td>Error</td>
<td>⛔</td>
<td>🙈</td>
</tr>
<tr>
<td>Warning</td>
<td>⚠️</td>
<td>🚧</td>
</tr>
</tbody>
</table>


