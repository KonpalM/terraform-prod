provider "aws" {
  region = "us-east-1
}

resource "aws_s3_bucket" "demo" {
  bucket = "konpal-public-demo-12345"
}

resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.demo.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.demo.arn}/*"
    }]
  })
}
