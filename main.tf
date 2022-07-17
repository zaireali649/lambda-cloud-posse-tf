# function code archieve
data "archive_file" "function_code" {
  type             = "zip"
  source_file      = "${path.module}/src/lambda_function.py"
  output_file_mode = "0666"
  output_path      = "${path.module}/files/lambda_function.zip"
}

data "archive_file" "layer_code" {
  type             = "zip"
  source_dir       = "${path.module}/src/shared/"
  output_file_mode = "0666"
  output_path      = "${path.module}/files/lambda_layer.zip"
}

module "demo_function" {
  source           = "./modules/lambda"
  depends_on = [data.archive_file.function_code, data.archive_file.layer_code]
  name             = "demo-function"
  filename         = data.archive_file.function_code.output_path
  source_code_hash = data.archive_file.function_code.output_base64sha256

  create_layer           = true
  layer_filename         = data.archive_file.layer_code.output_path
  layer_source_code_hash = data.archive_file.layer_code.output_base64sha256
  
}
