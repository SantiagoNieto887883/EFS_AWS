output "instance_ip_addr" {
  value       = {for service, i in aws_instance.test_terraform : service => i.private_ip}
  sensitive   = false
  description = "description"
}
