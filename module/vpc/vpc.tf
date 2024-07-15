resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = var.common_tags
}

resource "aws_subnet" "subnets" {
  count = length(var.subnet_cidrs)

  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.subnet_cidrs, count.index)

  tags = merge(
    var.common_tags,
    {
      Name                     = "subnet-${count.index}"
      "kubernetes.io/role/elb" = 1
    }
  )
}
