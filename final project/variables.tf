# GitHub
variable "github_pat" {
  description = "GitHub Personal Access Token"
  type        = string
}
variable "github_user" {
  description = "GitHub username"
  type        = string
}
variable "github_repo_url" {
  description = "GitHub repository name"
  type        = string
}

# RDS
variable "name" {
  description = "Назва інстансу або кластера"
  type        = string
  default     = "rds-cluster"
}
variable "use_aurora" {
  description = "Чи використовувати Aurora (true) або стандартний RDS (false)"
  type        = bool
  default     = false
}
variable "db_name" {
  description = "Назва бази даних"
  type        = string
  default     = "msolonin_rds"
}
variable "username" {
  description = "Master username"
  type        = string
}
variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "engine" {
  type    = string
  default = "postgres"
}
variable "engine_version" {
  type    = string
  default = "14.19"
}
variable "engine_cluster" {
  type    = string
  default = "aurora-postgresql"
}
variable "engine_version_cluster" {
  type    = string
  default = "15.14"
}
variable "instance_class" {
  type    = string
  default = "db.t3.medium"
}
variable "allocated_storage" {
  type    = number
  default = 20
}
variable "multi_az" {
  type    = bool
  default = false
}
variable "publicly_accessible" {
  type    = bool
  default = false
}
variable "backup_retention_period" {
  type        = number
  default     = 7
  description = "Кількість днів для збереження бекапів"
}

variable "aurora_replica_count" {
  type    = number
  default = 1
}

variable "parameter_group_family_rds" {
  type    = string
  default = "postgres14"
}
variable "parameter_group_family_aurora" {
  type    = string
  default = "aurora-postgresql15"
}
variable "parameters" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
variable "environment" {
  description = "Назва середовища (наприклад: dev, stage, prod)"
  type        = string
  default     = "dev"
}
variable "project" {
  description = "Назва проекту"
  type        = string
  default     = "goit"
}
