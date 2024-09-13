# create vpc
# terraform aws create vpc
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "tf-vpc"
  }
}

# create internet gateway and attach it to vpc
# terraform aws create internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = " tf-ig "
  }
}
# this will create two public subnetes in two different regions 
resource "aws_subnet" "public_subnets" {
  count      = length(var.cidr_public_subnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "Subnet-Public : Public Subnet ${count.index + 1}"
  }
}
# this will create two private subnetes in two different regions
resource "aws_subnet" "private_subnets" {
  count      = length(var.cidr_private_subnet)
  vpc_id     = aws_vpc.vpc.id
  cidr_block = element(var.cidr_private_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "Subnet-private : Private Subnet ${count.index + 1}"
  }
}

# create route table and add public route
# terraform aws create route table

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route { 
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "Route table for public subnets"
  }
}
resource "aws_eip" "nat_eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.cidr_public_subnet[0]  # Assuming you want to create the NAT Gateway in the first public subnet

  tags = {
    Name = "Portfolio-public-vpc-nat-gateway"
  }
}

# Create private route table and add private route, This will add up route to nat gateway, that will allow Inbound-Traffic
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "Route table for private subnets"
  }
}

# associate public subnet az1 to "public route table"
# terraform aws associate subnet with route table
resource "aws_route_table_association" "public_subnet_asso" {
  count           = length(var.cidr_public_subnet)
  depends_on      = [aws_subnet.public_subnets, aws_route_table.public_route_table]
  subnet_id       = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id  = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "private_subnet_asso" {
  count           = length(var.cidr_private_subnet)
  depends_on      = [aws_subnet.private_subnets, aws_route_table.private_route_table]
  subnet_id       = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id  = aws_route_table.private_route_table.id
}
# Currently we are building a two tier application that's why do not need a DB subnet
# resource "aws_db_subnet_group" "two-tier-db-sub" {
#   name       = "two-tier-db-sub"
#   subnet_ids = [ aws_subnet.private_subnets[2].id , aws_subnet.private_subnets[3].id ]

#   tags = {
#     Name = "Two-Tier DB Subnet Group"
#   }
# }