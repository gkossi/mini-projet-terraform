# Définition du volume EBS
resource "aws_ebs_volume" "myebs" {
  availability_zone = var.ebs_az
  tags              = var.ebs_common_tag
  size              = var.ebs_size
}