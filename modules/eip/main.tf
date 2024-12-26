# Définition de l'adresse ip publique de notre VM EC2
resource "aws_eip" "myeip" {
  domain   = "vpc"
  tags = var.eip_common_tag
}