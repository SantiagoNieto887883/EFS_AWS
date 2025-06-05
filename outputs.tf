output "instance_ip_addr" {
  value       = {for service, i in aws_instance.test_terraform : service => i.private_ip}
  sensitive   = false
  description = "description"
}
output "instance_ip_addr_pub" {
  value       = {for service, i in aws_instance.test_terraform : service => i.public_ip}
  sensitive   = false
  description = "description"
}