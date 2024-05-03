
locals {
  bucket_name = var.create_cloudtrail_bucket ? aws_s3_bucket.cloudtrail_bucket[0].id : var.bucket_name
}

resource "aws_s3_bucket" "cloudtrail_bucket" {
  count  = var.enabled && var.create_cloudtrail_bucket ? 1 : 0
  bucket = var.bucket_name
}

resource "aws_s3_bucket_acl" "cloudtrail_bucket_acl" {
  count  = var.enabled && var.create_cloudtrail_bucket ? 1 : 0
  bucket = aws_s3_bucket.cloudtrail_bucket[0].id
  acl    = "log-delivery-write"
}

resource "aws_cloudtrail" "trail" {
  count                         = var.enabled ? 1 : 0
  name                          = var.cloudtrail_name
  enable_logging                = var.enable_logging
  s3_bucket_name                = local.bucket_name
  enable_log_file_validation    = var.enable_log_file_validation
  sns_topic_name                = var.sns_topic_name
  is_multi_region_trail         = var.is_multi_region_trail
  include_global_service_events = var.include_global_service_events
  cloud_watch_logs_role_arn     = var.cloud_watch_logs_role_arn
  cloud_watch_logs_group_arn    = var.cloud_watch_logs_group_arn

  kms_key_id            = var.kms_key_arn
  is_organization_trail = var.is_organization_trail
  s3_key_prefix         = var.s3_key_prefix

  tags = var.tags

  dynamic "event_selector" {
    for_each = var.event_selector
    content {
      include_management_events        = lookup(event_selector.value, "include_management_events", null)
      read_write_type                  = lookup(event_selector.value, "read_write_type", null)
      exclude_management_event_sources = event_selector.value.exclude_management_event_sources

      dynamic "data_resource" {
        for_each = lookup(event_selector.value, "data_resource", [])
        content {
          type   = data_resource.value.type
          values = data_resource.value.values
        }
      }
    }
  }
  dynamic "insight_selector" {
    for_each = var.insight_selector
    content {
      insight_type = insight_selector.value.insight_type
    }
  }

}
