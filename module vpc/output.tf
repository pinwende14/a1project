output "public_subnet_id" {
  value = aws_subnet.pinare_public_subnet[*].id
}

output "private_subnet_id" {
  value = aws_subnet.pinare_private_subnet[*].id
}

output "vpc_id" {
  value = aws_vpc.pinare_vpc.id
}