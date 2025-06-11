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

variable Intance_type {
  type        = string
  default     = ""
  description = "description"
}

variable subnet_id {
  type        = string
  default     = ""
  description = "description"
}

variable ami {
  type        = string
  default     = ""
  description = "description"
}

variable Security_group {
  type        = set (string)
  description = "description"
}

variable key_name {
  type        = string
  default     = ""
  description = "description"
}

variable volume_type {
  type        = string
  default     = ""
  description = "description"
}

variable volume_size {
  type        = string
  default     = ""
  description = "description"
}

