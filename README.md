# terraform-aws-cloudtrail
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.47.0 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudtrail.trail](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudtrail) | resource |
| [aws_s3_bucket.cloudtrail_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.cloudtrail_bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | Name of the S3 bucket for storing CloudTrail logs | `string` | n/a | yes |
| <a name="input_cloud_watch_logs_group_arn"></a> [cloud\_watch\_logs\_group\_arn](#input\_cloud\_watch\_logs\_group\_arn) | ARN of the CloudWatch Logs log group to which CloudTrail logs are delivered | `string` | `null` | no |
| <a name="input_cloud_watch_logs_role_arn"></a> [cloud\_watch\_logs\_role\_arn](#input\_cloud\_watch\_logs\_role\_arn) | ARN of the IAM role for publishing CloudTrail logs to CloudWatch Logs | `string` | `null` | no |
| <a name="input_cloudtrail_name"></a> [cloudtrail\_name](#input\_cloudtrail\_name) | Name of the CloudTrail | `string` | n/a | yes |
| <a name="input_create_cloudtrail_bucket"></a> [create\_cloudtrail\_bucket](#input\_create\_cloudtrail\_bucket) | Determines if the S3 bucket for CloudTrail logs should be created | `bool` | `false` | no |
| <a name="input_enable_log_file_validation"></a> [enable\_log\_file\_validation](#input\_enable\_log\_file\_validation) | Enable log file validation in CloudTrail | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable logging for CloudTrail | `bool` | `true` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Determines if the CloudTrail should be enabled | `bool` | `true` | no |
| <a name="input_event_selector"></a> [event\_selector](#input\_event\_selector) | Advanced event selectors for CloudTrail logging | `list(map(any))` | `[]` | no |
| <a name="input_include_global_service_events"></a> [include\_global\_service\_events](#input\_include\_global\_service\_events) | Specifies whether to include global service events in CloudTrail logs | `bool` | n/a | yes |
| <a name="input_is_multi_region_trail"></a> [is\_multi\_region\_trail](#input\_is\_multi\_region\_trail) | Specifies whether the trail is created in all regions | `bool` | `true` | no |
| <a name="input_is_organization_trail"></a> [is\_organization\_trail](#input\_is\_organization\_trail) | Specifies whether the trail is an organization trail | `bool` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | KMS key ARN used for encrypting CloudTrail logs | `string` | `null` | no |
| <a name="input_s3_key_prefix"></a> [s3\_key\_prefix](#input\_s3\_key\_prefix) | S3 key prefix for the location of the saved log files | `string` | `""` | no |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | SNS topic name for CloudTrail notifications | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to assign to the resource | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudtrail_arn"></a> [cloudtrail\_arn](#output\_cloudtrail\_arn) | The ARN of the CloudTrail |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | The ID of the S3 bucket used for CloudTrail logs |
<!-- END_TF_DOCS -->