provider "aws" { region = "us-east-1" }

resource "aws_s3_bucket" "tf_state" {
  bucket = "konpal-tf-state-bucket-12345"  # unique name
  acl    = "private"

  versioning { enabled = true }  # keep history of state

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256" # simple; KMS is also fine
      }
    }
  }

  lifecycle {
    prevent_destroy = true       # protect state
  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name         = "konpal-tf-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
