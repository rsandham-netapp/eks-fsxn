variable "kubernetes_version" {
  default = 1.21
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default = "us-east-2"
  description = "aws region"
}

variable "fsxname" {
  default = "eksfs"
  description = "default FSxN name"
}

variable "fsx_admin_password" {
  default = "Netapp1!"
  description = "default FSxN filesystem admin password"
}
