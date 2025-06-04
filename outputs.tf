output "instance_ip_addr" {
  value       = aws_instance.test_terraform.private_ip
  sensitive   = false
  description = "description"
}
