output "definitions-bucket" {
  description = "The bucket created to store de antivirus definitions"
  value       = aws_s3_bucket.antivirus-definitions
}

output "scanner-function" {
  description = "The created scanner function resource"
  value       = aws_lambda_function.antivirus-scanner
}

output "update-function" {
  description = "The created definitions update function resource"
  value       = aws_lambda_function.antivirus-update
}

output "scanner-function-role" {
  description = "The role used by the scanner function"
  value       = aws_iam_role.antivirus-scanner-role
}

output "update-function-role" {
  description = "The role used by the definitions update function"
  value       = aws_iam_role.antivirus-update-role
}

output "scanner-function-policy" {
  description = "The policy attached to the scanner function role"
  value       = aws_iam_policy.antivirus-scanner-policy
}

output "update-function-policy" {
  description = "The policy attached to the definitions update function role"
  value       = aws_iam_policy.antivirus-update-policy
}
