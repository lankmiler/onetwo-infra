variable "app" {
  type        = string
  description = "Name of application"
}

variable "port" {
  type        = string
  description = "port of application"
}

variable "app_namespace" {
  type        = string
  description = "Project namespace"
  default     = "test"
}

variable "mode" {
  type        = string
  description = "Front end mode"
  default     = "test"
}

variable "zone" {
  type        = string
  description = "Env zone"
  default     = "test"
}

variable "domain_name" {
  type        = string
  description = "Domain mame"
}

variable "image" {
  type        = string
  description = "Container image"  
}
