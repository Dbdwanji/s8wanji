output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.vpc.id
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway attached to the VPC."
  value       = aws_internet_gateway.internet-gateway.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value = [
    aws_subnet.public-subnet-1.id,
    aws_subnet.public-subnet-2.id,
    aws_subnet.public-subnet-3.id,
  ]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value = [
    aws_subnet.private-subnet-1.id,
    aws_subnet.private-subnet-2.id,
    aws_subnet.private-subnet-3.id,
  ]
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.nat-gateway.id
}

output "public_route_table_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.public-route-table.id
}

output "private_route_table_id" {
  description = "The ID of the private route table."
  value       = aws_route_table.private-route-table.id
}
