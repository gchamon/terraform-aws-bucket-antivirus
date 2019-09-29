variable "buckets-to-scan" {
  type = list(string)
}

variable "scanner-environment-variables" {
  default = {}
}

variable "updater-environment-variables" {
  default = {}
}

variable "allow-public-access" {
  default = false
}

variable "antivirus-update-rate" {
  description = "Configures the antivirus update rate. Syntax is the same of cloudwatch rate schedule expression for rules"
  default = "3 hours"
}