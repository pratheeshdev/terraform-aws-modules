resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "public_subnet" {
  count             = 2
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = element(var.public_subnet,count.index)
  availability_zone = element(var.azlist, count.index)
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.myvpc.id

}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}
resource "aws_route_table_association" "ra" {
 count=2
  subnet_id      = aws_subnet.public_subnet.*.id
  route_table_id = aws_route_table.rt.id
}


output "myoutput" {
  value = aws_vpc.myvpc.id
}

output "myoutput1" {
  value = aws_subnet.public_subnet.*.id
}

