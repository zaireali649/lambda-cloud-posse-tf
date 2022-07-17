# lambda function
resource "aws_lambda_function" "function" {
  function_name    = var.name
  description      = var.description
  role             = var.function_role_arn == null ? aws_iam_role.function_role.arn : var.function_role_arn
  handler          = var.handler
  runtime          = var.runtime
  timeout          = var.timeout
  filename         = var.filename
  source_code_hash = var.source_code_hash

  # env vars
  dynamic "environment" {
    for_each = length(keys(var.environment_variables)) == 0 ? [] : [true]
    content {
      variables = var.environment_variables
    }
  }

  # layers
  layers = var.create_layer ? [aws_lambda_layer_version.function_layer[0].arn] : []

  # vpc
  dynamic "vpc_config" {
    for_each = var.vpc_subnet_ids != null && var.vpc_security_group_ids != null ? [true] : []
    content {
      security_group_ids = var.vpc_security_group_ids
      subnet_ids         = var.vpc_subnet_ids
    }
  }

  # fs
  dynamic "file_system_config" {
    for_each = var.file_system_arn != null && var.file_system_local_mount_path != null ? [true] : []
    content {
      local_mount_path = var.file_system_local_mount_path
      arn              = var.file_system_arn
    }
  }

  # tags
  tags = merge({
    Name = var.name
  }, var.tags)
}

resource "aws_lambda_layer_version" "function_layer" {
  count               = var.create_layer ? 1 : 0
  filename            = var.layer_filename
  source_code_hash    = var.layer_source_code_hash
  layer_name          = local.function_layer_name
  compatible_runtimes = var.compatible_runtimes
  description         = var.layer_description

}

