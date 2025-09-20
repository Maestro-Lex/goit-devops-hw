output "s3_bucket_name" {
  description = "Назва S3-бакета для стейтів"
  value       = module.s3_backend.s3_bucket_name
}

output "dynamodb_table_name" {
  description = "Назва таблиці DynamoDB для блокування стейтів"
  value       = module.s3_backend.dynamodb_table_name
}

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

output "ecr_url" {
  description = "Адреса Ecr репозиторію"
  value       = module.ecr.ecr_url
}
