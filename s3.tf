resource "aws_s3_bucket" "antivirus-definitions" {
  bucket_prefix = "bucket-antivirus-definitions"
}

resource "aws_s3_bucket_policy" "public-antivirus-definitions" {
  count = (
    var.allow-public-access == true
    ? 1
    : 0
  )

  bucket = aws_s3_bucket.antivirus-definitions

  policy = templatefile(
    "${path.module}/policies/bucket-antivirus-definitions.json.tmpl",
    { bucket-name = aws_s3_bucket.antivirus-definitions.bucket }
  )
}