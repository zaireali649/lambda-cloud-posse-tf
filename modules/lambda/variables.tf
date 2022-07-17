variable "name" {
  type        = string
  description = "function name"
}

variable "description" {
  type        = string
  description = "function description"
  default     = null
}

variable "role_name" {
  type        = string
  description = "function role name"
  default     = null
}

variable "function_role_arn" {
  type        = string
  description = "function role arn"
  default     = null
}

variable "additional_policy_arns" {
  type        = list(string)
  description = "additional policy arns for function role"
  default     = []
}

variable "handler" {
  type        = string
  description = "lambda function handler"
  default     = "lambda_function.lambda_handler"
}

variable "runtime" {
  type        = string
  description = "lambda function runtime"
  default     = "python3.9"
}

variable "timeout" {
  type        = number
  description = "lambda function timeout seconds"
  default     = "900"
}

variable "filename" {
  type        = string
  description = "function code zip"
}

variable "source_code_hash" {
  type        = string
  description = " base64-encoded SHA256 checksum of code output file"
  default     = null
}

variable "environment_variables" {
  type        = map(string)
  description = "map defining env vars for the lambda function"
  default     = {}
}

variable "vpc_subnet_ids" {
  description = "list of subnets when function running in VPC"
  type        = list(string)
  default     = null
}

variable "vpc_security_group_ids" {
  description = "list of sg ids when function running in VPC"
  type        = list(string)
  default     = null
}

variable "file_system_arn" {
  description = "arn of the access point for efs"
  type        = string
  default     = null
}

variable "file_system_local_mount_path" {
  description = "path where function can access the fs, starting with /mnt/"
  type        = string
  default     = null
}

variable "tags" {
  type        = any
  description = "resource tags"
  default     = {}
}

# layer version vars
variable "create_layer" {
  type        = bool
  description = "create layer version"
  default     = false
}

variable "layer_filename" {
  type        = string
  description = "layer version zip filename. Required if create_layer is true"
  default     = null
}

variable "layer_name" {
  type        = string
  description = "function layer name"
  default     = null
}

variable "compatible_runtimes" {
  type        = list(string)
  description = "layer compatible runtimes"
  default     = ["python3.7", "python3.8", "python3.9"]
}

variable "layer_description" {
  type        = string
  description = "layer description"
  default     = null
}

variable "layer_source_code_hash" {
  type        = string
  description = "base64-encoded SHA256 checksum of code output file"
  default     = null
}