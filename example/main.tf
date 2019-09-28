provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "test-antivirus"
}

module "antivirus" {
  source = "../"

  buckets-to-scan = [
    aws_s3_bucket.test.bucket
  ]
}