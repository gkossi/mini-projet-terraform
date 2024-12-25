variable "ebs_az" {
  description = "La zone de disponibilité de l'EBS"
  type        = string
  default     = "us-east-1a"
}

variable "ebs_common_tag" {
  description = "Le tag sur le volume EBS"
  type = map(string)
  default = {
    Name = "ebs-mini-projet-terraform"
  }
}

variable "ebs_size" {
  description = "La taille du volume EBS en GB"
  type        = number
  default     = 10
}