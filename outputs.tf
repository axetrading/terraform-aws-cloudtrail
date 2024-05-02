output "s3_bucket_id" {
  value       = var.enabled && var.create_cloudtrail_bucket ? aws_s3_bucket.cloudtrail_bucket[0].id : null
  description = "The ID of the S3 bucket used for CloudTrail logs"
}

output "cloudtrail_arn" {
  value       = var.enabled ? aws_cloudtrail.trail[0].arn : null
  description = "The ARN of the CloudTrail"
}
