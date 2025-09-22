resource "aws_subnet" "sub_1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.cidr_block_sub_1
  availability_zone = var.az_1
  tags = {
    Name = "sub_1"
  }
}

resource "aws_subnet" "sub_2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.cidr_block_sub_2
  availability_zone = var.az_2
  tags = {
    Name = "sub_2"
  }
}