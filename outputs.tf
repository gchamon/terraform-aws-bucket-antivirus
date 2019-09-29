output "definitions-bucket" {
  value = aws_s3_bucket.antivirus-definitions
}

output "scanner-function" {
  value = aws_lambda_function.antivirus-scanner
}

output "update-function" {
  value = aws_lambda_function.antivirus-update
}

output "scanner-function-role" {
  value = aws_iam_role.antivirus-scanner-role
}

output "update-function-role" {
  value = aws_iam_role.antivirus-update-role
}

output "scanner-function-policy" {
  value = aws_iam_policy.antivirus-scanner-policy
}

output "update-function-policy" {
  value = aws_iam_policy.antivirus-update-policy
}
