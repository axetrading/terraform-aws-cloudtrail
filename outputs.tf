output "s3_bucket_id" {
  value       = aws_s3_bucket.cloudtrail_bucket[0].id
  description = "The ID of the S3 bucket used for CloudTrail logs"
}

output "cloudtrail_arn" {
  value       = aws_cloudtrail.trail[0].arn
  description = "The ARN of the CloudTrail"
}
