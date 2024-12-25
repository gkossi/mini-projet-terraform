output "eip_id_output" {
  description = "L'ID de l'EIP"
  value = aws_eip.myeip.id
}

output "eip_public_ip_output" {
  description = "L'address IP Public"
  value = aws_eip.myeip.public_ip
}