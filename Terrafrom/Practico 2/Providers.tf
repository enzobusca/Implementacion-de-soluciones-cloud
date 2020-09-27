terraform {
  required_provider {
    aws = {
      source = "hashicorp/aws"
      version = "3.7"
    }
  }
}

provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  token      = var.aws_token
  profile    = var.profile  
}