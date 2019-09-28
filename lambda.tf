module "antivirus-update" {
  source = "spring-media/lambda/aws"

  function_name = "bucket-antivirus-update"
  timeout       = 300
  memory_size   = 512
  runtime       = "python2.7"
  handler       = "update.lambda_handler"

  filename         = "${path.module}/.tmp/bucket-antivirus-function/build/lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/.tmp/bucket-antivirus-function/build/lambda.zip")

  event = {
    type                = "cloudwatch-scheduled-event"
    schedule_expression = "rate(3 hours)"
  }

  environment = {
    variables = merge(
      {
        AV_DEFINITION_S3_BUCKET = aws_s3_bucket.antivirus-function.bucket
      },
      var.environment-variables.antivirus-update
    )
  }

  tags = {
    _id = null_resource.build-antivirus-from-source.id
  }
}
