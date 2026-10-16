
resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"

        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role = aws_iam_role.lambda_exec_role.name

  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda" {
  type        = "zip"
  source_dir  = "${path.module}/../lambda_function"
  output_path = "${path.module}/lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name

  role    = aws_iam_role.lambda_exec_role.arn
  handler = var.lambda_handler
  runtime = var.runtime

  filename         = data.archive_file.lambda.output_path
  source_code_hash = data.archive_file.lambda.output_base64sha256

  depends_on = [
    aws_iam_role_policy_attachment.lambda_basic
  ]
}



