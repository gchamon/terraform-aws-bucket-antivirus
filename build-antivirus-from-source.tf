resource "null_resource" "build-antivirus-from-source" {
  provisioner "local-exec" {
    command = "bash ${path.module}/scripts/build-antivirus-from-source.sh"
  }
}

resource "aws_s3_bucket" "antivirus-code" {
  bucket_prefix = "antivirus-code"
}

resource "aws_s3_bucket_object" "antivirus-code" {
  depends_on = [null_resource.build-antivirus-from-source]

  bucket = aws_s3_bucket.antivirus-code.bucket
  key    = "lambda.zip"

  source = "/tmp/bucket-antivirus-function/build/lambda.zip"
}
