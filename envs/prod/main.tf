terraform {
  backend "s3" {
    bucket         = "konpal-tf-state-bucket-12345"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "konpal-tf-locks"
    encrypt        = true
  }
}

provider "aws" { region = "us-east-1" }

resource "aws_s3_bucket" "secure" {
  bucket = "konpal-prod-secure-12345"
  acl    = "private"

  versioning { enabled = true }  

  server_side_encryption_configuration {   
    rule { apply_server_side_encryption_by_default { sse_algorithm = "aws:kms" } }
  }
}

resource "aws_s3_bucket_public_access_block" "pab" {
  bucket                  = aws_s3_bucket.secure.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
