resource "aws_s3_bucket" "antivirus-definitions" {
  bucket_prefix = "bucket-antivirus-definitions"
  force_destroy = true
}

resource "aws_s3_bucket" "antivirus-code" {
  bucket_prefix = "antivirus-code"
  force_destroy = true
}

resource "aws_s3_bucket_policy" "public-antivirus-definitions" {
  count = (
    var.allow-public-access == true
    ? 1
    : 0
  )

  bucket = aws_s3_bucket.antivirus-definitions.bucket

  policy = templatefile(
    "${path.module}/policies/bucket-antivirus-definitions.json.tmpl",
    { bucket-name = aws_s3_bucket.antivirus-definitions.bucket }
  )
}