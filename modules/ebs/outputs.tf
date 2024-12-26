output "ebs_id_output" {
  description = "L'ID du volume EBS"
  value = aws_ebs_volume.myebs.id
}