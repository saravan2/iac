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

variable "aws_ssm_parameter_ami" {
  description = "ami used for ec2 instance"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "us-east-1"
}