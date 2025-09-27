variable "ecr_name" {
  description = "Назва Ecr репозиторію"
  type        = string
}

variable "image_tag_mutability" {
  description = "MUTABLE або IMUTABLE для незмінних параметрів"
  type        = string
  default     = "MUTABLE"
}

variable "force_delete" {
  description = "Примусове видалення образів при видаленні репозиторію"
  type        = bool
  default     = true
}

variable "image_scan_on_push" {
  description = "Сканування образів на вразливості"
  type        = bool
  default     = true
}

variable "repository_policy" {
  description = "Набір JSON політик для ECR репозиторія"
  type        = string
  default     = null
}
