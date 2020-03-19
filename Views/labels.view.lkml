explore: labels {}
view: labels {
  sql_table_name: public.order_items  ;;

############################################################## Parameters {

# Parameters {

  parameter: perf_metric_selector {
    description: "Performance Metric Selector"
    default_value: "CPO"
    type: unquoted
    allowed_value: {
      label: "Adv Value"
      value: "Adv_Value"
    }
    allowed_value: {
      label: "Audience"
      value: "Audience"
    }
    allowed_value: {
      label: "Avg Cart"
      value: "Avg_Cart"
    }
    allowed_value: {
      label: "Bounce Rate"
      value: "Bounce_rate"
    }
    allowed_value: {
      label: "Clicks"
      value: "Clicks"
    }
    allowed_value: {
      label: "COS"
      value: "COS"
    }
    allowed_value: {
      label: "COS PC+PV"
      value: "COS_PC_PV"
    }
    allowed_value: {
      label: "COS PV"
      value: "COS_PV"
    }
    allowed_value: {
      label: "Cost"
      value: "Cost"
    }
    allowed_value: {
      label: "COV"
      value: "COV"
    }
    allowed_value: {
      label: "CPC"
      value: "CPC"
    }
    allowed_value: {
      label: "CPO"
      value: "CPO"
    }
    allowed_value: {
      label: "CPO PC+PV"
      value: "CPO_PC_PV"
    }
    allowed_value: {
      label: "CPO PV"
      value: "CPO_PV"
    }
    allowed_value: {
      label: "CPV"
      value: "CPV"
    }
    allowed_value: {
      label: "CTR"
      value: "CTR"
    }
    allowed_value: {
      label: "CVR"
      value: "CVR"
    }
    allowed_value: {
      label: "CVR PV ND"
      value: "CVR_PV_ND"
    }
    allowed_value: {
      label: "Displays"
      value: "Displays"
    }
    allowed_value: {
      label: "eCPM"
      value: "eCPM"
    }
    allowed_value: {
      label: "Exposed users"
      value: "Exposed_users"
    }
    allowed_value: {
      label: "Qualified Visits"
      value: "Qualified_visits"
    }
    allowed_value: {
      label: "Reach"
      value: "Reach"
    }
    allowed_value: {
      label: "Revenue"
      value: "Revenue"
    }
    allowed_value: {
      label: "Revenue ND"
      value: "Revenue_ND"
    }
    allowed_value: {
      label: "Revenue PC+PV"
      value: "Revenue_PC_PV"
    }
    allowed_value: {
      label: "Revenue PV"
      value: "Revenue_PV"
    }
    allowed_value: {
      label: "ROAS"
      value: "ROAS"
    }
    allowed_value: {
      label: "Sales"
      value: "Sales"
    }
    allowed_value: {
      label: "Sales PC ND"
      value: "Sales_PC_ND"
    }
    allowed_value: {
      label: "Sales PV ND"
      value: "Sales_PV_ND"
    }
    allowed_value: {
      label: "Visits"
      value: "Visits"
    }
    allowed_value: {
      label: "Win rate"
      value: "Win_rate"
    }
  }

  parameter: perf_metric_ratio_selector {
    type: unquoted
    description: "Performance Metric Ratio Selector"
    default_value: "CPO"
    allowed_value: {
      label: "Avg Cart"
      value: "Avg_Cart"
    }
    allowed_value: {
      label: "Bounce Rate"
      value: "Bounce_rate"
    }
    allowed_value: {
      label: "COS"
      value: "COS"
    }
    allowed_value: {
      label: "COS PC+PV"
      value: "COS_PC_PV"
    }
    allowed_value: {
      label: "COS PV"
      value: "COS_PV"
    }
    allowed_value: {
      label: "COV"
      value: "COV"
    }
    allowed_value: {
      label: "CPC"
      value: "CPC"
    }
    allowed_value: {
      label: "CPO"
      value: "CPO"
    }
    allowed_value: {
      label: "CPO PC+PV"
      value: "CPO_PC_PV"
    }
    allowed_value: {
      label: "CPO PV"
      value: "CPO_PV"
    }
    allowed_value: {
      label: "CPV"
      value: "CPV"
    }
    allowed_value: {
      label: "CTR"
      value: "CTR"
    }
    allowed_value: {
      label: "CVR"
      value: "CVR"
    }
    allowed_value: {
      label: "CVR PV ND"
      value: "CVR_PV_ND"
    }
    allowed_value: {
      label: "eCPM"
      value: "eCPM"
    }
    allowed_value: {
      label: "Reach"
      value: "Reach"
    }
    allowed_value: {
      label: "ROAS"
      value: "ROAS"
    }
    allowed_value: {
      label: "Win rate"
      value: "Win_rate"
    }
  }

  parameter: perf_metric_volume_selector {
    description: "Performance Metric Volume Selector"
    default_value: "Sales"
    type: unquoted
    allowed_value: {
      label: "Adv Value"
      value: "Adv_Value"
    }
    allowed_value: {
      label: "Audience"
      value: "Audience"
    }
    allowed_value: {
      label: "Clicks"
      value: "Clicks"
    }
    allowed_value: {
      label: "Cost"
      value: "Cost"
    }
    allowed_value: {
      label: "Displays"
      value: "Displays"
    }
    allowed_value: {
      label: "Exposed users"
      value: "Exposed_users"
    }
    allowed_value: {
      label: "Qualified Visits"
      value: "Qualified_visits"
    }
    allowed_value: {
      label: "Revenue"
      value: "Revenue"
    }
    allowed_value: {
      label: "Revenue ND"
      value: "Revenue_ND"
    }
    allowed_value: {
      label: "Revenue PC+PV"
      value: "Revenue_PC_PV"
    }
    allowed_value: {
      label: "Revenue PV"
      value: "Revenue_PV"
    }
    allowed_value: {
      label: "Sales"
      value: "Sales"
    }
    allowed_value: {
      label: "Sales PC ND"
      value: "Sales_PC_ND"
    }
    allowed_value: {
      label: "Sales PV ND"
      value: "Sales_PV_ND"
    }
    allowed_value: {
      label: "Visits"
      value: "Visits"
    }
  }

  parameter: overview_dimension_selector {
    description: "Quick Top"
    type:  string
    allowed_value: {
      label: "by campaign"
      value: "Campaign"
    }
    allowed_value: {
      label: "by product"
      value: "Product"
    }
  }



#  } / Parameters

############################################################## Labels and text {

  dimension: overview_dynamic_dimension_title{
    label: "Quick Top Name"
    label_from_parameter: overview_dimension_selector
    group_label: "Dynamic Dimensions"
    type: string
    #value_format_name: decimal_1
    sql:     {% if overview_dimension_selector._parameter_value ==  "'Campaign'"%}
      'Performance by Campaign'
          {% elsif overview_dimension_selector._parameter_value ==  "'Product'" %}
      'Performance by Product'
      {%else%}
      ''
        {%endif%}
       ;;
          # Dynamic Label
          # html:
          # {% if overview_dimension_selector._parameter_value ==  "'Campaign'"%}
          #     <p><font color="#696969" size="5"><b>{{ _localization["Performance by Campaign"] }}</b></font></p>
          # {% elsif overview_dimension_selector._parameter_value ==  "'Product'" %}
          #     <p><font color="#696969" size="5"><b>{{ _localization["Performance by Product"] }}</b></font></p>
          # {% else %}
          #     <p><font color="#696969" size="5"><b>Not defined</b></font></p>
          # {% endif %}
          # ;;
    #   html:
    #   <p><font color="#696969" size="5"><b>{{_localization[value]}}</b></font></p>
    # ;;
    }




# Troubleshooting {


#     dimension: performance_metrics_troubleshooting_first_complement_name {
#       label: "1st Complement"
#       #label_from_parameter: perf_metric_selector
#       group_label: "Troubleshooting Dynamic Dimensions"
#       type: string
#       #value_format_name: decimal_1
#       sql:
#       'Cost'
#      ;;
#       html:
#       <font size="5" color="#696969"><b>{{_localization[value]}}</b></font>
# ;;
#
#     }
#
#     dimension: performance_metrics_troubleshooting_2nd_complement_name {
#       label: "2nd Complement"
#       #label_from_parameter: perf_metric_selector
#       group_label: "Troubleshooting Dynamic Dimensions"
#       type: string
#       #value_format_name: decimal_1
#       sql:
#       {% if  perf_metric_selector._parameter_value  == "CPO"%}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "CPO_PV"%}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "CPO_PC_PV"%}
#         'CPO PV'
#       {% elsif  perf_metric_selector._parameter_value  == "Sales" %}
#         'CVR'
#       {% elsif  perf_metric_selector._parameter_value  == "Sales_PV_ND" %}
#         'CVR PV ND'
#       {% elsif  perf_metric_selector._parameter_value  == "Sales_PC_ND" %}
#         'CVR'
#       {% elsif  perf_metric_selector._parameter_value  == "Revenue" %}
#         'Sales'
#       {% elsif  perf_metric_selector._parameter_value  == "Revenue_PV" %}
#         'Sales PV ND'
#       {% elsif  perf_metric_selector._parameter_value  == "Revenue_PC_PV" %}
#         'Revenue PV'
#       {% elsif  perf_metric_selector._parameter_value  == "Revenue_ND" %}
#         'Sales PC ND'
#       {% elsif  perf_metric_selector._parameter_value  == "Adv_Value" %}
#         'Sales'
#       {% elsif  perf_metric_selector._parameter_value  == "Cost" %}
#         'Clicks'
#       {% elsif  perf_metric_selector._parameter_value  == "COS" %}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "COV" %}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "COS_PV" %}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "COS_PC_PV" %}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "ROAS" %}
#         'Cost'
#       {% elsif  perf_metric_selector._parameter_value  == "Avg_Cart" %}
#         'Sales'
#       {% elsif  perf_metric_selector._parameter_value  == "CPC" %}
#         'Clicks'
#       {% elsif  perf_metric_selector._parameter_value  == "eCPM" %}
#         'Displays'
#       {% elsif  perf_metric_selector._parameter_value  == "Clicks" %}
#         'Displays'
#       {% elsif  perf_metric_selector._parameter_value  == "Displays" %}
#         'Audience'
#       {% elsif  perf_metric_selector._parameter_value  == "CTR" %}
#         'Displays'
#       {% elsif  perf_metric_selector._parameter_value  == "CVR" %}
#         'Clicks'
#       {% elsif  perf_metric_selector._parameter_value  == "CVR_PV_ND" %}
#         'Displays'
#       {% elsif  perf_metric_selector._parameter_value  == "Audience" %}
#         'Exposed Users'
#       {% elsif  perf_metric_selector._parameter_value  == "Reach" %}
#         'Exposed Users'
#       {% elsif  perf_metric_selector._parameter_value  == "Win_rate" %}
#         'Potential Displays'
#       {% elsif  perf_metric_selector._parameter_value  == "Exposed_users" %}
#         'Audience'
#       {% elsif  perf_metric_selector._parameter_value  == "Visits" %}
#         'CPV'
#       {% elsif  perf_metric_selector._parameter_value  == "Qualified_visits" %}
#         'Bounce Rate'
#       {% elsif  perf_metric_selector._parameter_value  == "Bounce_rate" %}
#         'Qualified Visits'
#       {% elsif  perf_metric_selector._parameter_value  == "CPV" %}
#         'Cost'
#       {% else %}
#         null
#       {% endif %}
#      ;;
#       html: <font size="5" color="#696969"><b>{{_localization[value]}}</b></font> ;;
#
#     }

    dimension: curent_period_name {
      label: "Current Period"
      #label_from_parameter: perf_metric_selector
      # group_label: "Troubleshooting Dynamic Dimensions"
      type: string
      #value_format_name: decimal_1
      sql: Current Period"] }}'
        ;;
      html: <font size="4" color="#696969">{{ value }}</font> ;;

    }

    dimension: previous_period_name {
      label: "Previous Period"
      #label_from_parameter: perf_metric_selector
      # group_label: "Troubleshooting Dynamic Dimensions"
      type: string
      #value_format_name: decimal_1
      sql: Previous Period"] }}'
        ;;
      html: <font size="4" color="#696969">{{ value }}</font> ;;

    }


    # } / labels and text


    filter: first_text {
      view_label: "Text Tile Labels"
      type: string
      sql: 1 ;;
    }
    parameter: first_text_size {
      view_label: "Text Tile Labels"

      type: number
      default_value: "3"
    }
    filter: second_text {
      view_label: "Text Tile Labels"
      type: string
      sql: 1 ;;
    }
    parameter: second_text_size {
      view_label: "Text Tile Labels"
      type: number
      default_value: "2"
    }

    parameter: notbold{
      view_label: "Text Tile Labels"
      type: yesno
    }

#     dimension: two_text_label {
#       view_label: "Text Tile Labels"
#       sql: 1 ;;
#       html: <font color="#696969" size="{{first_text_size._parameter_value}}">{% if notbold._parameter_value == 'true' %}{{_localization[_filters['first_text']]}}{% else %}<b>{{_localization[_filters['first_text']]}}</b> {% endif %}</font><font color="#696969" size="{{second_text_size._parameter_value}}">      {{_localization[_filters['second_text']]}}</font> ;;
#     }
#     dimension: label {
#       view_label: "Text Tile Labels"
#       sql: 1 ;;
#       html: <font color="#696969" size="{{first_text_size._parameter_value}}">{% if notbold._parameter_value == 'true' %}{{_localization[_filters['first_text']]}}{% else %}<b>{{_localization[_filters['first_text']]}} {% endif %}</font> ;;
#     }




  }
