variable "ec2_instance_type" {
  type        = string
  default     = "t2.micro"
  description = "Configuration du type d'instance AWS"
}

variable "ec2_user" {
  type = string
  default = "ubuntu"
  description = "L'utilisateur configuré pour l'instance EC2"
}

variable "ec2_common_tag" {
  type = map(string)
  default = {
    Name = "ec2-mini-projet-terraform"
  }
  description = "Le tag sur l'instance ec2"
}

variable "ec2_key_name" {
  type    = string
  default = "expertdevops"
  description = "La paire de clé de l'instance EC2"
}

variable "aws_sg" {
  type        = string
  default     = "mini-projet-terraform-sg"
  description = "Le groupe de sécurité"
}