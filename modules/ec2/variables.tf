variable "ec2_instance_type" {
  description = "Le type d'instance EC2"
  type        = string
  default     = "t2.micro"
}

variable "ec2_user" {
  description = "L'utilisateur configuré pour l'instance EC2"
  type = string
  default = "ubuntu"
}

variable "ec2_common_tag" {
  description = "Le tag sur l'instance EC2"
  type = map(string)
  default = {
    Name = "ec2-mini-projet-terraform"
  }
}

variable "ec2_key_name" {
  description = "Nom de la paire de clés pour l'accès SSH à l'instance EC2"
  type    = string
  default = "expertdevops"
}

variable "ec2_sg" {
  description = "Liste des groupes de sécurité à associer à l'instance EC2"
  type        = list(string)
  default     = ["mini-projet-terraform-sg"]
}

variable "subnet_id" {
  description = "ID du sous-réseau où l'instance sera créée"
  type        = string
}

variable "ec2_public_ip" {
  description = "L'adresse ip publique de l'instance EC2"
  type = string
  default = "0.0.0.0"
}