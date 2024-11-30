output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of the VPC"
}

output "public_subnet_ids" {
  value       = [for subnet in aws_subnet.public_subnet : subnet.id]
  description = "IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = [for subnet in aws_subnet.private_subnet : subnet.id]
  description = "IDs of the private subnets"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.internet_gateway.id
  description = "ID of the Internet Gateway"
}

output "nat_gateway_id" {
  value       = aws_nat_gateway.nat_gateway.id
  description = "ID of the NAT Gateway"
}
