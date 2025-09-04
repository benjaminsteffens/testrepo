resource "aws_subnet" "sub_1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "sub_1"
  }
}

resource "aws_subnet" "sub_2" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "sub_2"
  }
}