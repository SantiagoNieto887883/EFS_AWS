output "instance_ip_addr" {
  value       = {for service, i in aws_instance.recurso_1 : service => i.private_ip}
  sensitive   = false
  description = "description"
}
output "instance_ip_addr_pub" {
  value       = {for service, i in aws_instance.recurso_1 : service => i.public_ip}
  sensitive   = false
  description = "description"
}