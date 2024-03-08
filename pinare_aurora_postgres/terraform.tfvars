aws_region = "us-east-1"

subnet_ids = [
  "subnet-0ec8f617a33e20ec2",
  "subnet-0e4a88f795e88fd67"
]

security_group_id = "sg-03c77da029413afcd"

master_password = "YourStrongPassword123!"

common_tags = {
  id             = "9999"
  owner          = "piwende"
  teams          = "pinare"
  environment    = "dev"
  project        = "aurora-postgres"
  create_by      = "pinare-Terraform"
  cloud_provider = "aws"
}