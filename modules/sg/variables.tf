variable "sg_name" {
  description = "Le nom du groupe de sécurité"
  type        = string
  default     = "mpt-allow-http-https-ssh"
}

variable "sg_common_tag" {
  description = "Le tag sur le groupe de sécurité"
  type        = map(string)
  default = {
    Name  = "sg-mini-projet-terraform"
  }
}

variable "ingress_allowed_ipv4_cidrs" {
  description = "Liste des blocs CIDR ipv4 autorisés à accéder à la VM"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ingress_allowed_ipv6_cidrs" {
  description = "Liste des blocs CIDR ipv6 autorisés à accéder à la VM"
  type        = list(string)
  default     = ["::/0"]
}

variable "egress_allowed_ipv4_cidrs" {
  description = "Liste des blocs CIDR ipv4 auxquels la VM pourra accéder"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_allowed_ipv6_cidrs" {
  description = "Liste des blocs CIDR ipv6 auxquels la VM pourra accéder"
  type        = list(string)
  default     = ["::/0"]
}