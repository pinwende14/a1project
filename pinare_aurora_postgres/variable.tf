variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS cluster"
  type        = list(string)
  default     = ["subnet-0ec8f617a33e20ec2", "subnet-0e4a88f795e88fd67"]

}

variable "security_group_id" {
  description = "Security group ID for the RDS cluster"
  type        = string
  default     = "sg-03c77da029413afcd"
}

variable "master_password" {
  description = "The master password for the RDS cluster"
  type        = string
  sensitive   = true
  # You can set a default value if needed
  # default     = "defaultpassword"
}

variable "common_tags" {
  type = map(any)
  default = {
    "id"             = "9999"
    "owner"          = "pinwende"
    "teams"          = "pinare"
    "environment"    = "dev"
    "project"        = "aurora-postgres"
    "create_by"      = "pinare-Terraform"
    "cloud_provider" = "aws"
  }
}

