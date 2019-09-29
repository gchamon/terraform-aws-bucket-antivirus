variable "buckets-to-scan" {
  description = "List of bucket names to be scanned by the antivirus"
  type = list(string)
}

variable "scanner-environment-variables" {
  description = "Custom environment variables for the scanner function"
  default = {}
}

variable "updater-environment-variables" {
  description = "Custom environment variables for the definitions update function"
  default = {}
}

variable "allow-public-access" {
  description = "If true, contents of the bucket in which the antivirus definitions are saved will be public. Good for sharing the same definitions across multiple accounts."
  default = false
}

variable "antivirus-update-rate" {
  description = "Configures the antivirus update rate. Syntax is the same of cloudwatch rate schedule expression for rules"
  default = "3 hours"
}