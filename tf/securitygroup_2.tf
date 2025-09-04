resource "aws_security_group" "securitygroup_2" {
  name        = "securitygroup_2"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc1.id
  region      = "us-east-2"

  tags = {
    Name = "securitygroup_2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_443_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_22_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}

resource "aws_vpc_security_group_ingress_rule" "allow_80_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}