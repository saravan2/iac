variable "instance_name" {
  description = "Value of the name tag for EC2 instance"
  type        = string
  default     = "AppServerInstance"
}

variable "security_group_name" {
  description = "Value of the name tag for Security group"
  type        = string
  default     = "SecurityGroup"
}
