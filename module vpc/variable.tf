variable "aws_region" {
  type    = string
  default = "us-east-1"

}

variable "common_tags" {
  type = map(any)
  default = {
    "id"             = "1979"
    "owner"          = "Pinwende"
    "teams"          = "DEL"
    "environment"    = "dev"
    "project"        = "del"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
  }
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"

}

variable "aws_availability_zones" {
  type = list(any)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]
}


