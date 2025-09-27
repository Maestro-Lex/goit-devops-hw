variable "bucket_name" {
  description = "Назва S3 bucket для Terraform state"
  type        = string
}

variable "table_name" {
  description = "The name of the DynamoDB table for Terraform locks"
  type        = string
}
