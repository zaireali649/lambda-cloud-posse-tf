# function code archieve
data "archive_file" "function_code" {
  type             = "zip"
  source_file      = "${path.module}/src/lambda_function.py"
  output_file_mode = "0666"
  output_path      = "${path.module}/files/lambda_function.zip"
}

module "demo_function" {
  source  = "cloudposse/lambda-function/aws"

  filename      = data.archive_file.function_code.output_path
  function_name = "demo-function"
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  layers = ["arn:aws:lambda:us-east-1:458806987020:layer:pandas_38_layer:1"]
}
