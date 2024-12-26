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