
terraform {
  backend "s3" {
    bucket       = "serverless-cicd-tfstate-123"
    key          = "lambda-cicd/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
    profile      = "serverless-lab"
  }
}
