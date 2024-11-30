# VPC
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# Internet Gateway
variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

# Public Subnets
variable "public_subnets" {
  description = "Map of public subnets with CIDR blocks and availability zones"
  type = map(object({
    cidr = string
    az   = string
  }))
}

# Private Subnets
variable "private_subnets" {
  description = "Map of private subnets with CIDR blocks and availability zones"
  type = map(object({
    cidr = string
    az   = string
  }))
}

# Route Tables
variable "public_route_table_name" {
  description = "Name of the public route table"
  type        = string
}

variable "private_route_table_name" {
  description = "Name of the private route table"
  type        = string
}

# NAT Gateway
variable "nat_eip_name" {
  description = "Name of the Elastic IP for the NAT Gateway"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
}

variable "nat_gateway_subnet" {
  description = "Name of the public subnet for the NAT Gateway"
  type        = string
}
