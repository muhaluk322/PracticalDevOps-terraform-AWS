variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["80", "443", "22", "8080"]
}

variable "vpc_id" {}

variable "environment" {}
