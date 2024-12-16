output "ec2_eip_id" {
  value = aws_eip.ec2_public_ip.id
}

output "ec2_eip" {
  value = aws_eip.ec2_public_ip.public_ip
}