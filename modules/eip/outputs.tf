output "eip_id" {
  description = "L'ID de l'EIP"
  value = aws_eip.myeip.id
}

output "eip_public_ip" {
  description = "L'address IP Public"
  value = aws_eip.myeip.public_ip
}