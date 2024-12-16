# Définition de l'adresse ip publique de notre VM EC2
resource "aws_eip" "ec2_public_ip" {
  instance = var.instance_id
  domain   = "vpc"
  tags = var.eip_common_tag
}