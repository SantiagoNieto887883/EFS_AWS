variable "access_key" {
  type        = string
  default     = ""
  description = "access_key"
  sensitive   = true
}

variable "secret_key" {
  type        = string
  default     = ""
  description = "secret_key"
  sensitive   = true
}

variable "services_names" {
  description = "Nombre de los ec2"
  type        = set(string)
}
