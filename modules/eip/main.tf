# Définition de l'adresse ip publique de notre VM EC2
resource "aws_eip" "myeip" {
  instance = var.instance_id
  vpc      = true
  tags = var.eip_common_tag
}