# S#-backend
output "s3_bucket_name" {
  description = "Назва S3-бакета для стейтів"
  value       = module.s3_backend.s3_bucket_name
}
output "dynamodb_table_name" {
  description = "Назва таблиці DynamoDB для блокування стейтів"
  value       = module.s3_backend.dynamodb_table_name
}

# VPC
output "vpc_name" {
  description = "Назва віртуального середовища VPC"
  value       = module.vpc.vpc_name
}
output "public_subnets" {
  description = "Публічні підмережі"
  value       = module.vpc.public_subnets
}
output "private_subnets" {
  description = "Приватні підмережі"
  value       = module.vpc.private_subnets
}

# ECR
output "ecr_url" {
  description = "Адреса Ecr репозиторію"
  value       = module.ecr.ecr_url
}
output "ecr_arn" {
  description = "ARN Ecr репозиторію"
  value       = module.ecr.ecr_arn
}

# EKS
output "eks_cluster_endpoint" {
  description = "EKS API endpoint for connecting to the cluster"
  value       = module.eks.eks_cluster_endpoint
}
output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.eks_cluster_name
}
output "eks_node_role_arn" {
  description = "IAM role ARN for EKS Worker Nodes"
  value       = module.eks.eks_node_role_arn
}
output "oidc_provider_arn" {
  description = "OIDC Provider ARN"
  value       = module.eks.oidc_provider_arn
}
output "oidc_provider_url" {
  description = "OIDC Provider URL"
  value       = module.eks.oidc_provider_url
}
