variable "secret_name" {
  type        = string
  description = "Secret name."
}

variable "sensitive" {
  type        = bool
  description = "Mark values as sensitive."
  default     = true
}