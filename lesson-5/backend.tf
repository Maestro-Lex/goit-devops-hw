# Після "terraform destroy" необхідно зміст файлу закоментувати 
# перед відтворенням стейту (інфраструктури) перед "terraform applay"
# Потім розкоментувати файл, щоб terraform знав де зберігати стейт,
# та виконати "terraform init -reconfigure" (параметр для повторного підключення бекенду)
#terraform {
#  backend "s3" {
#    bucket         = "goit-devops-bucket-00001"
#    key            = "lesson-5/terraform.tfstate"
#    region         = "us-east-1"
#    dynamodb_table = "terraform-locks"
#    encrypt        = true
#    # use_lockfile   = true # The parameter "dynamodb_table" is deprecated. Use parameter "use_lockfile" instead.
#  }
#}
