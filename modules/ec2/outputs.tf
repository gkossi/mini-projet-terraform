output "ec2_id" {
  value = aws_instance.myec2.id
}

output "ec2_public_ip" {
  value = aws_instance.myec2.public_ip
}

output "ec2_az" {
  value = aws_instance.myec2.availability_zone
}

#PUBLIC IP: 72.44.57.63; ID: i-0d06f322a79058cb5; AZ: us-east-1c 
#ID: ${aws_instance.myec2.id};
#PUBLIC IP: ${self.public_ip};
#AZ: ${aws_instance.myec2.availability_zone} > infos_ec2.txt"
  
