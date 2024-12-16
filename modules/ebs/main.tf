# Définition de l'EBS
resource "aws_ebs_volume" "myec2_ebs" {
  availability_zone = var.ebs_az
  tags              = var.ebs_common_tag
  size              = var.ebs_size
}