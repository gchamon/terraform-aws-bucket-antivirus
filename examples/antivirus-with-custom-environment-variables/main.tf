provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "test" {
  bucket_prefix = "test-antivirus"
  force_destroy = true
}

module "antivirus" {
  source = "../../"

  buckets-to-scan = [
    aws_s3_bucket.test.bucket
  ]

  scanner-environment-variables = {
    AV_DELETE_INFECTED_FILES = "True"
  }
}
