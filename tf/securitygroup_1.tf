resource "aws_security_group" "securitygroup_1" {
  name        = "securitygroup_1"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc1.id
  region      = var.region
  tags = {
    Name = "securitygroup_1"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_443" {
  security_group_id = aws_security_group.securitygroup_1.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_443
  ip_protocol       = "tcp"
  to_port           = var.port_443
}

resource "aws_vpc_security_group_ingress_rule" "allow_22" {
  security_group_id = aws_security_group.securitygroup_1.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_22
  ip_protocol       = "tcp"
  to_port           = var.port_22
}

resource "aws_vpc_security_group_ingress_rule" "allow_8080" {
  security_group_id = aws_security_group.securitygroup_1.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_8080
  ip_protocol       = "tcp"
  to_port           = var.port_8080
}

resource "aws_vpc_security_group_ingress_rule" "allow_80" {
  security_group_id = aws_security_group.securitygroup_1.id
  cidr_ipv4         = var.cidr_ipv4
  from_port         = var.port_80
  ip_protocol       = "tcp"
  to_port           = var.port_80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.securitygroup_1.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = "-1" 
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_2" {
  security_group_id = aws_security_group.securitygroup_2.id
  cidr_ipv4         = var.cidr_ipv4
  ip_protocol       = "-1" 
}