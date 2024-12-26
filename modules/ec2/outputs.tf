output "ec2_id_output" {
  description = "L'ID de la VM EC2 créée"
  value = aws_instance.myec2.id
}

output "ec2_az_output" {
  description = "La zone de disponiblité de la VM EC2 créée"
  value = aws_instance.myec2.availability_zone
}