resource "aws_security_group" "securitygroup_2" {
  name        = "securitygroup_2"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc1.id
  region      = var.region

  tags = {
    Name = "securitygroup_2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_443_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_443
  ip_protocol       = "tcp"
  to_port           = var.port_443
}

resource "aws_vpc_security_group_ingress_rule" "allow_22_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_22
  ip_protocol       = "tcp"
  to_port           = var.port_22
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_8080
  ip_protocol       = "tcp"
  to_port           = var.port_8080
}

resource "aws_vpc_security_group_ingress_rule" "allow_80_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_80
  ip_protocol       = "tcp"
  to_port           = var.port_80
}