# Create VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = var.igw_name
  }
}

# Create Public Subnets
resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = true

  tags = {
    Name = each.key
  }
}

# Create Private Subnets
resource "aws_subnet" "private_subnet" {
  for_each = var.private_subnets

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = each.value.az
  map_public_ip_on_launch = false

  tags = {
    Name = each.key
  }
}

# Create Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = var.public_route_table_name
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_route_table_association" {
  for_each = aws_subnet.public_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.public_route_table.id
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  vpc = true

  tags = {
    Name = var.nat_eip_name
  }
}

# Create NAT Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet[var.nat_gateway_subnet].id

  tags = {
    Name = var.nat_gateway_name
  }
}

# Create Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = var.private_route_table_name
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_route_table_association" {
  for_each = aws_subnet.private_subnet

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private_route_table.id
}
