
variable "lambda_function_name" {
  description = "Name of Lambda function"
  type        = string
  default     = "serverless-devops-lambda"
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "app.handler"
}

variable "runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "python3.13"
}
variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}