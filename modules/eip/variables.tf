variable "instance_id" {
  type        = string
  description = "ID de l'instance EC2 provenant du module EC2"
}

variable "eip_common_tag" {
  type = map(string)
  default = {
    Name = "eip-mini-projet-terraform"
  }
  description = "Le tag sur l'eip de l'instance ec2"
}