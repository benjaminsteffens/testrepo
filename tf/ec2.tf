data "template_file" "ec2_user_data" {
  template = file("${path.module}/bootstrap.sh")
}

resource "aws_instance" "webserver1" {
  ami                         = "ami-0cfde0ea8edd312d4"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-2a"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.securitygroup_1.id]
  subnet_id                   = aws_subnet.sub_1.id
  user_data                   = data.template_file.ec2_user_data.template


  tags = {
    Name = "webserver1"
  }
}

resource "aws_instance" "webserver2" {
  ami                         = "ami-0cfde0ea8edd312d4"
  instance_type               = "t2.micro"
  availability_zone           = "us-east-2b"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.securitygroup_2.id]
  subnet_id                   = aws_subnet.sub_2.id
  user_data                   = data.template_file.ec2_user_data.template


  tags = {
    Name = "webserver2"
  }
}



