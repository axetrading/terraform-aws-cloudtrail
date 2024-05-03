variable "enabled" {
  description = "Determines if the CloudTrail should be enabled"
  type        = bool
  default     = true
}

variable "create_cloudtrail_bucket" {
  description = "Determines if the S3 bucket for CloudTrail logs should be created"
  type        = bool
  default     = false
}

variable "bucket_name" {
  description = "Name of the S3 bucket for storing CloudTrail logs"
  type        = string
}

variable "cloudtrail_name" {
  description = "Name of the CloudTrail"
  type        = string
}

variable "enable_logging" {
  description = "Enable logging for CloudTrail"
  type        = bool
  default     = true
}

variable "enable_log_file_validation" {
  description = "Enable log file validation in CloudTrail"
  type        = bool
  default     = true
}

variable "sns_topic_name" {
  description = "SNS topic name for CloudTrail notifications"
  type        = string
  default     = null
}

variable "is_multi_region_trail" {
  description = "Specifies whether the trail is created in all regions"
  type        = bool
  default     = true
}

variable "include_global_service_events" {
  description = "Specifies whether to include global service events in CloudTrail logs"
  type        = bool
  default     = true
}

variable "cloud_watch_logs_role_arn" {
  description = "ARN of the IAM role for publishing CloudTrail logs to CloudWatch Logs"
  type        = string
  default     = null
}

variable "cloud_watch_logs_group_arn" {
  description = "ARN of the CloudWatch Logs log group to which CloudTrail logs are delivered"
  type        = string
  default     = null
}

variable "kms_key_arn" {
  description = "KMS key ARN used for encrypting CloudTrail logs"
  type        = string
  default     = null
}

variable "is_organization_trail" {
  description = "Specifies whether the trail is an organization trail"
  type        = bool
}

variable "s3_key_prefix" {
  description = "S3 key prefix for the location of the saved log files"
  type        = string
  default     = ""
}

variable "event_selector" {
  type = list(object({
    data_resource = optional(list(object({
      type   = string
      values = list(string)
    })))
    exclude_management_event_sources = optional(set(string))
    include_management_events        = optional(bool)
    read_write_type                  = optional(string)
  }))

  description = "Specifies the management and data events that CloudTrail logs."
  default     = []
}


variable "insight_selector" {
  type = list(object({
    insight_type = string
  }))

  description = "Specifies the type of insights to log in CloudTrail"
  default     = []
}


variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}