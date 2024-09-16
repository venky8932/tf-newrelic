# New Relic Account Configuration
variable "newrelic_account_id" {
  description = "New Relic Account ID"
  type        = string
}

variable "newrelic_api_key" {
  description = "New Relic API Key"
  type        = string
  sensitive   = true
}

# First Synthetic Monitor Configuration
variable "monitor_name_1" {
  description = "Name of the first synthetic monitor"
  type        = string
}

variable "uri_1" {
  description = "The URL to monitor using Ping for the first monitor"
  type        = string
}

variable "validation_string_1" {
  description = "Optional string to validate in the response body for the first monitor"
  type        = string
  default     = ""
}

# Second Synthetic Monitor Configuration
variable "monitor_name_2" {
  description = "Name of the second synthetic monitor"
  type        = string
}

variable "uri_2" {
  description = "The URL to monitor using Ping for the second monitor"
  type        = string
}

variable "validation_string_2" {
  description = "Optional string to validate in the response body for the second monitor"
  type        = string
  default     = ""
}

# General Monitor Configuration
variable "frequency" {
  description = "Frequency of the synthetic check in minutes"
  type        = number
  default     = 10
}

variable "locations" {
  description = "List of locations to run the synthetic monitor from"
  type        = list(string)
  default     = ["AWS_US_EAST_1", "AWS_US_WEST_2"]
}

# Alert Policy and Condition
variable "alert_policy_name" {
  description = "Name of the alert policy"
  type        = string
}

variable "alert_condition_name_1" {
  description = "Name of the alert condition for the first monitor"
  type        = string
}

variable "alert_condition_name_2" {
  description = "Name of the alert condition for the second monitor"
  type        = string
}
