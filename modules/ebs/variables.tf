variable "ebs_az" {
  type        = string
  default     = "us-east-1a"
  description = "La zone de disponibilité de l'EBS"
}

variable "ebs_common_tag" {
  type = map(string)
  default = {
    Name = "ebs-mini-projet-terraform"
  }
  description = "Le tag sur le volume EBS"
}

variable "ebs_size" {
  type        = number
  default     = 10
  description = "La taille du volume EBS en GB"
}