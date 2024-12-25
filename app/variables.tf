variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "La région de travail dans le cloud AWS"
}

variable "aws_credentials" {
  type        = string
  default     = "C:/Users/BORIS/Downloads/aws_credentials"
  description = "Le fichier contenant les credentials"
}

/* variable "s3_bucket" {
  type    = string
  default = "mini-projet-terraform-backend"
  description = "Le backend de stockage pour le state file de l'infra"
}

variable "s3_bucket_key" {
  type    = string
  default = "mini-projet-terraform.tfstate"
  description = "Le state file de l'infra qui sera stocké dans le backend"
} */