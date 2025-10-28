# Unsafe bucket

terraform {
  backend "s3" {
    bucket         = "konpal-tf-state-bucket-123456"  # from backend step
    key            = "nonprod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "konpal-tf-locks"
    encrypt        = true
  }
}

provider "aws" { region = "us-east-1" }

resource "aws_s3_bucket" "demo" {
  bucket = "konpal-nonprod-demo-12345"
  acl    = "public-read"
}
