/* output "sg_id" {
  description = "L'ID du groupe de sécurité"
  value       = aws_security_group.mysg.id
} */

output "sg_name_output" {
  description = "Le nom du groupe de sécurité"
  value = aws_security_group.mysg.name
}