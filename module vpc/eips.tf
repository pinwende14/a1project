resource "aws_eip" "pinare_eip" {
#   count = length(var.aws_availability_zones)
  vpc   = true
  tags = merge(var.common_tags, {
    Name = format("%s-pinare_eip", var.common_tags["id"])
    },
  )
  depends_on = [aws_internet_gateway.pinare_igw]
}