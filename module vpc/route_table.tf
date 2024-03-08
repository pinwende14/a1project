# Create Route Table for Private Subnets
resource "aws_route_table" "pinare_private_route_table" {
  vpc_id = aws_vpc.pinare_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.pinare_nat_gateway.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["id"]}-pinare_private_route_table"
  })
}

# Create Route Table for Public Subnets
resource "aws_route_table" "pinare_route_public" {
  vpc_id = aws_vpc.pinare_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pinare_igw.id
  }

  tags = merge(var.common_tags, {
    Name = "${var.common_tags["id"]}-pinare_route_public"
  })
}