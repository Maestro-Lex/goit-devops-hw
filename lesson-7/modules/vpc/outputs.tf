output "vpc_id" {
  description = "ID створеної VPC"
  value       = aws_vpc.main.id
}

output "public_subnets" {
  description = "Список ID публічних підмереж"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "Список ID приватних підмереж"
  value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
  description = "ID Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

output "vpc_name" {
  description = "Имя VPC"
  value       = var.vpc_name
}

output "nat_gateway_id" {
  description = "NAT gateway ID's"
  value       = aws_nat_gateway.nat.id
}
