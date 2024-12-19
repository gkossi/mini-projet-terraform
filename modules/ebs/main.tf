# Définition de l'EBS
resource "aws_ebs_volume" "myebs" {
  availability_zone = var.ebs_az
  tags              = var.ebs_common_tag
  size              = var.ebs_size
}

/* resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/xvdf"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = var.instance_id
} */