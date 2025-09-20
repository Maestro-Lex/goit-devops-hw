output "ecr_url" {
  description = "Адреса Ecr репозиторію"
  value       = "https://${aws_ecr_repository.goit_devops_ecr.repository_url}"
}

output "ecr_arn" {
  description = "ARN створеного репозиторію"
  value       = aws_ecr_repository.goit_devops_ecr.arn
}
