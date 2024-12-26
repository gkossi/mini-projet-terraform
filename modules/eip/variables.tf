variable "eip_common_tag" {
  description = "Le tag sur l'eip de l'instance ec2"
  type = map(string)
  default = {
    Name = "eip_mini_projet_terraform"
  }
}