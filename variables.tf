variable "aws_region" {
  description = "AWS region where resources will be created."
}

variable "availability_zone" {
  description = "AWS availability_zone where resources will be created."
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC."
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet."
}

variable "instance_ami" {
  description = "AMI ID for the AWS instance."
}

variable "instance_type" {
  description = "Instance type for the AWS instance."
}
