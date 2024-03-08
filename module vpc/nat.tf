# Create NAT Gateway
resource "aws_nat_gateway" "pinare_nat_gateway" {
  allocation_id = aws_eip.pinare_eip.id
  subnet_id     = element(aws_subnet.pinare_public_subnet.*.id, 0) # Choose any one of the public subnets for NAT Gateway
  tags = merge(var.common_tags, {
    Name = "${var.common_tags["id"]}-pinare_nat_gateway"
  })
}