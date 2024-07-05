resource "aws_subnet" "new_subnets" {
  count = length(var.subnet_cidrs)

  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  
  tags = {
    Name = "new-subnet-${count.index}"
  }
}
