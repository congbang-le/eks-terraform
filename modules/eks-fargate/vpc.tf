resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = var.common_tags
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_subnet" "subnets" {
  count                   = length(var.subnet_cidrs)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = element(var.subnet_cidrs, count.index)
  availability_zone       = element(data.aws_availability_zones.available.names, count.index % length(data.aws_availability_zones.available.names))

  tags = merge(
    var.common_tags,
    {
      Name                     = "subnet-${count.index}"
      "kubernetes.io/role/elb" = 1
    }
  )
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = var.common_tags
}


resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = var.common_tags
}


resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.subnets[0].id

  tags = var.common_tags
}


resource "aws_route_table" "private_rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private-rtb"
  }
}

resource "aws_route_table_association" "private_rta" {
  count = length(aws_subnet.subnets)

  subnet_id      = element(aws_subnet.subnets.*.id, count.index)
  route_table_id = aws_route_table.private_rtb.id
}

