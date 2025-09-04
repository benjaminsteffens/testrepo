resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.sub_1.id
  route_table_id = aws_route_table.rt_1.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.sub_2.id
  route_table_id = aws_route_table.rt_2.id
}