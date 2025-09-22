resource "aws_vpc" "vpc1" {
  cidr_block = var.cidr_block
  tags = {
    Name = "vpc1"
  }
}