variable "buckets-to-scan" {
  type = list(string)
}

variable "environment-variables" {
  default = {
    antivirus-function = {}
    antivirus-update = {}
  }
}

variable "allow-public-access" {
  default = false
}