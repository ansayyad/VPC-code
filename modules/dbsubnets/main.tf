resource "aws_subnet" "database_subnet" {
  count             = length(var.database_subnet_cidrs)
  vpc_id            = var.vpc_id
  cidr_block        = element(var.database_subnet_cidrs, count.index)
  availability_zone = element(var.database_subnet_azs, count.index)

  tags = {
    Name    = "Database-Subnet-${count.index + 1}"
    
  }
}

resource "aws_route_table" "database_rt" {
  count  = (length(var.database_subnet_cidrs) > 0) ? 1 : 0
  vpc_id = var.vpc_id

  tags = {

    Name    = "Database Route Table"
  
  }
}

resource "aws_route" "private_route" {
  count                  = (length(var.database_subnet_cidrs) > 0) ? 1 : 0
  route_table_id         = element(aws_route_table.database_rt.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(var.nat_gw_id, count.index)
}

resource "aws_route_table_association" "database_subnet_rt_association" {
  count          = length(var.database_subnet_cidrs)
  subnet_id      = element(aws_subnet.database_subnet.*.id, count.index)
  route_table_id = element(aws_route_table.database_rt.*.id, count.index)
}