output "ebs_id_output" {
  description = "L'ID du volume EBS"
  value = aws_ebs_volume.myebs.id
}

output "ebs_az_output" {
  description = "La zone de disônibilité de l'EBS"
  value = aws_ebs_volume.myebs.availability_zone
}