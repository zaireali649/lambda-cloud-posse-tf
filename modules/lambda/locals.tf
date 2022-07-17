locals {
  function_role_name           = var.role_name == null ? join("-", [var.name, "role"]) : var.role_name
  function_logging_policy_name = join("-", [var.name, "role-policy"])
  function_layer_name          = var.layer_name == null ? join("-", [var.name, "layer"]) : var.layer_name
}