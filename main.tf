provider "newrelic" {
  account_id = var.newrelic_account_id
  api_key    = var.newrelic_api_key
}

# First Synthetic Ping Monitor
resource "newrelic_synthetics_monitor" "ping_monitor_1" {
  name        = var.monitor_name_1
  type        = "SIMPLE"
  status      = "ENABLED"
  frequency   = var.frequency
  locations   = var.locations
  uri         = var.uri_1
  validation_string = var.validation_string_1
}

# Second Synthetic Ping Monitor
resource "newrelic_synthetics_monitor" "ping_monitor_2" {
  name        = var.monitor_name_2
  type        = "SIMPLE"
  status      = "ENABLED"
  frequency   = var.frequency
  locations   = var.locations
  uri         = var.uri_2
  validation_string = var.validation_string_2
}
# main.tf

# Create the New Relic alert policy
resource "newrelic_alert_policy" "synthetic_monitor_policy" {
  name = "Synthetic Monitor Ping Alert Policy"
}

# Define the condition for the synthetic monitor ping failure
resource "newrelic_alert_condition" "synthetic_monitor_ping_condition" {
  policy_id = newrelic_alert_policy.synthetic_monitor_policy.id
  name      = "Ping Failure Alert Condition"

  type = "synthetics_monitor_failure"  # Monitor failure condition

  entities = [
    "your_synthetic_monitor_id"  # Replace with your synthetic monitor ID
  ]

  terms {
    duration      = 5
    operator      = "equal"
    priority      = "critical"
    threshold     = 1
    time_function = "all"
  }

  violation_close_timer = 60  # Violation closes after 60 minutes
}

# Define the notification channel
resource "newrelic_alert_channel" "alert_channel" {
  name = "Slack Channel for Alerts"  # Name of the notification channel
  type = "slack"                     # Type of channel, could be email, slack, etc.

  config = {
    url                = "https://hooks.slack.com/services/your/slack/hook"  # Replace with your Slack webhook URL
    auth_token         = "your_new_relic_api_key"  # Replace with your API key
    channel            = "#alerts"                # Channel to post the message in Slack
    notify_on_violations = true
  }
}

# Associate the alert channel with the alert policy
resource "newrelic_alert_policy_channel" "policy_channel_association" {
  policy_id  = newrelic_alert_policy.synthetic_monitor_policy.id
  channel_id = newrelic_alert_channel.alert_channel.id
}

