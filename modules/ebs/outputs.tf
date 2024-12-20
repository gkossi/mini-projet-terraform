output "ebs_id" {
  description = "L'ID du volume EBS"
  value = aws_ebs_volume.myebs.id
}

output "ebs_az" {
  description = "La zone de disônibilité du volume EBS"
  value = aws_ebs_volume.myebs.ebs_az
}