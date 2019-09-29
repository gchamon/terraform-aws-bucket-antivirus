resource "aws_iam_policy" "antivirus-scanner-policy" {
  name_prefix = "BucketAntivirusUpdate"
  path        = "/"
  description = "Allows antivirus lambda function to scan buckets"

  policy = templatefile(
    "${path.module}/policies/bucket-antivirus-scanner.json.tmpl",
    {
      bucket-names                      = var.buckets-to-scan
      antivirus-definitions-bucket-name = aws_s3_bucket.antivirus-definitions.bucket
    }
  )
}

resource "aws_iam_role" "antivirus-scanner-role" {
  name_prefix        = "bucket-antivirus-scanner"
  assume_role_policy = file("${path.module}/policies/lambda-assume-role.json")
}

resource "aws_iam_role_policy_attachment" "antivirus-scanner-policy" {
  policy_arn = aws_iam_policy.antivirus-scanner-policy.arn
  role       = aws_iam_role.antivirus-scanner-role.name
}
