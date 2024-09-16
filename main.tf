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


