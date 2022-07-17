# lambda iam role assume policy
data "aws_iam_policy_document" "function_role_assume_policy" {
  version = "2012-10-17"
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }
  }
}

# lambda iam role
resource "aws_iam_role" "function_role" {
  name               = local.function_role_name
  description        = "${var.name} function IAM role"
  assume_role_policy = data.aws_iam_policy_document.function_role_assume_policy.json
  tags = merge({
    Name = local.function_role_name
  }, var.tags)
}

# lambda iam role policy document
data "aws_iam_policy_document" "function_role_policy_doc" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

# lambda iam role policy (logging)
resource "aws_iam_policy" "function_role_policy" {
  name        = local.function_logging_policy_name
  path        = "/"
  description = "lambda logging policy"
  policy      = data.aws_iam_policy_document.function_role_policy_doc.json
  tags = merge({
    Name = local.function_logging_policy_name
  }, var.tags)
}

resource "aws_iam_role_policy_attachment" "function_role_policy_attachment" {
  role       = aws_iam_role.function_role.name
  policy_arn = aws_iam_policy.function_role_policy.arn
}

# additional policy arns
resource "aws_iam_role_policy_attachment" "additional_policies" {
  count      = length(var.additional_policy_arns)
  role       = aws_iam_role.function_role.name
  policy_arn = var.additional_policy_arns[count.index]
}