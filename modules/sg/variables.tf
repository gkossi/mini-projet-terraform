variable "sg_name" {
  description = "Le nom du groupe de sécurité"
  type        = string
  default     = "mpt-allow-http-https-ssh"
  #default     = "mpt_allow_http_https_ssh"
}

variable "sg_common_tag" {
  description = "Le tag sur le groupe de sécurité"
  type        = map(string)
  default = {
    Name  = "sg-mini-projet-terraform"
    #Name  = "sg_mini_projet_terraform"
  }
}

/* variable "vpc_id" {
  description = "ID du VPC pour le groupe de sécurité"
  type        = string
} */

variable "ingress_allowed_cidrs" {
  description = "Liste des blocs CIDR autorisés à accéder à la VM"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_allowed_cidrs" {
  description = "Liste des blocs CIDR autorisés pour etre accédé par la VM"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}