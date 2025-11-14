terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0"
    }
  }
  backend "s3" {
    bucket = "aws-my-s3-bucket-bejohn"
    key = "terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "aws-my-dynamodb"
  }
}
