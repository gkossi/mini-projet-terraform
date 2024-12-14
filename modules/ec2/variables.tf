variable "instance_type" {
  type        = string
  default     = "t2.nano"
  description = "Configuration du type d'instance AWS"
}

variable "aws_common_tag" {
  type = map(string)
  default = {
    Name = "ec2-expertdevops" # ec2-ggs
  }
  description = "Configuration du tag sur l'instance ec2"
}

variable "sg_name" {
  type        = string
  description = "set sg name "
  default     = "ggs-sg"
}
