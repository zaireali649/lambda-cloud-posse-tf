<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_policy.function_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.additional_policies](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.function_role_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_layer_version.function_layer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_iam_policy_document.function_role_assume_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.function_role_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_policy_arns"></a> [additional\_policy\_arns](#input\_additional\_policy\_arns) | additional policy arns for function role | `list(string)` | `[]` | no |
| <a name="input_compatible_runtimes"></a> [compatible\_runtimes](#input\_compatible\_runtimes) | layer compatible runtimes | `list(string)` | <pre>[<br>  "python3.7",<br>  "python3.8",<br>  "python3.9"<br>]</pre> | no |
| <a name="input_create_layer"></a> [create\_layer](#input\_create\_layer) | create layer version | `bool` | `false` | no |
| <a name="input_description"></a> [description](#input\_description) | function description | `string` | `null` | no |
| <a name="input_environment_variables"></a> [environment\_variables](#input\_environment\_variables) | map defining env vars for the lambda function | `map(string)` | `{}` | no |
| <a name="input_file_system_arn"></a> [file\_system\_arn](#input\_file\_system\_arn) | arn of the access point for efs | `string` | `null` | no |
| <a name="input_file_system_local_mount_path"></a> [file\_system\_local\_mount\_path](#input\_file\_system\_local\_mount\_path) | path where function can access the fs, starting with /mnt/ | `string` | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | function code zip | `string` | n/a | yes |
| <a name="input_function_role_arn"></a> [function\_role\_arn](#input\_function\_role\_arn) | function role arn | `string` | `null` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | lambda function handler | `string` | `"lambda_function.lambda_handler"` | no |
| <a name="input_layer_description"></a> [layer\_description](#input\_layer\_description) | layer description | `string` | `null` | no |
| <a name="input_layer_filename"></a> [layer\_filename](#input\_layer\_filename) | layer version zip filename. Required if create\_layer is true | `string` | `null` | no |
| <a name="input_layer_name"></a> [layer\_name](#input\_layer\_name) | function layer name | `string` | `null` | no |
| <a name="input_layer_source_code_hash"></a> [layer\_source\_code\_hash](#input\_layer\_source\_code\_hash) | base64-encoded SHA256 checksum of code output file | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | function name | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | function role name | `string` | `null` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | lambda function runtime | `string` | `"python3.9"` | no |
| <a name="input_source_code_hash"></a> [source\_code\_hash](#input\_source\_code\_hash) | base64-encoded SHA256 checksum of code output file | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | resource tags | `any` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | lambda function timeout seconds | `number` | `"900"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | list of sg ids when function running in VPC | `list(string)` | `null` | no |
| <a name="input_vpc_subnet_ids"></a> [vpc\_subnet\_ids](#input\_vpc\_subnet\_ids) | list of subnets when function running in VPC | `list(string)` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->