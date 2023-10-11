# locals {
#   policy_name = var.policy_name == null ? "${var.application_name}: AMAN-AlertPolicy" : var.policy_name
# }

# resource "newrelic_alert_policy" "policy" {
#   name                = local.policy_name
#   incident_preference = var.incident_preference
#   channel_ids         = var.channel_ids
# }

# resource "newrelic_nrql_alert_condition" "apdex_condition" {
#     count = length(var.var-name)
#   policy_id = newrelic_alert_policy.policy.id
#   name = var.var-name[count.index]
 
#   type        = "static"
#   runbook_url = var.runbook_url
#   enabled     = true

#   warning {
#     operator              = "below"
#     threshold             = var.apdex_warning_threshold
#     threshold_duration    = var.apdex_duration
#     threshold_occurrences = "ALL"
#   }

#   critical {
#     operator              = "below"
#     threshold             = var.apdex_critical_threshold
#     threshold_duration    = var.apdex_duration
#     threshold_occurrences = "ALL"
#   }

#   nrql {
#     query             = "SELECT average(host.memoryUsedPercent) AS 'Memory used %' FROM Metric WHERE `entityGuid` = 'NDE3NjQ5NHxJTkZSQXxOQXw4NzY1NDE3NzY4MzIxNzY5MjIw'"
#     //evaluation_offset = 3
#   }
# }

# resource "newrelic_nrql_alert_condition" "error_rate_condition" {
#   policy_id = newrelic_alert_policy.policy.id

#   name        = "Error rate (High)"
#   type        = "static"
#   runbook_url = var.runbook_url
#   enabled     = true

#   critical {
#     operator              = "above"
#     threshold             = var.error_rate_critical_threshold
#     threshold_duration    = var.error_rate_duration
#     threshold_occurrences = "ALL"
#   }

#   warning {
#     operator              = "above"
#     threshold             = var.error_rate_warning_threshold
#     threshold_duration    = var.error_rate_duration
#     threshold_occurrences = "ALL"
#   }

#   nrql {
#     query             = "SELECT percentage(count(*), WHERE error IS TRUE) FROM Transaction WHERE appName = '${var.application_name}' AND accountId = ${var.account_id}"
#     evaluation_offset = 3
#   }

#  }

resource "newrelic_alert_policy" "foo" {
  name = "foo"
}

resource "newrelic_nrql_alert_condition" "foo" {
  account_id                     = 4176494
  policy_id                      = newrelic_alert_policy.foo.id
  type                           = "static"
  name                           = "foo"
  description                    = "Alert when transactions are taking too long"
  runbook_url                    = "https://www.example.com"
  enabled                        = true
  violation_time_limit_seconds   = 3600
  fill_option                    = "static"
  fill_value                     = 1.0
  aggregation_window             = 60
  aggregation_method             = "event_flow"
  aggregation_delay              = 120
  expiration_duration            = 120
  open_violation_on_expiration   = true
  close_violations_on_expiration = true
  slide_by                       = 30

  nrql {
    query = "SELECT average(duration) FROM Transaction where appName = 'Your App'"
  }

  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }

  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}