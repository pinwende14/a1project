resource "aws_internet_gateway" "pinare_igw" {
  depends_on = [aws_vpc.pinare_vpc ]
  vpc_id = aws_vpc.pinare_vpc.id
  tags = merge(var.common_tags, {
    Name = format("%s-pinare_igw", var.common_tags["id"])
    },
  )
}
