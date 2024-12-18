variable "sg_name" {
  type        = string
  default     = "mpt_allow_http_https_ssh"
  description = "Le nom du groupe de sécurité"
}

variable "sg_common_tag" {
  type        = map(string)
  default = {
    Name  = "sg-mini-projet-terraform"
  }
  description = "Le tag sur le groupe de sécurité"
}