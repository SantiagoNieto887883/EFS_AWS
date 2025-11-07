module "module_1_QA" {
  source = "./module_1/EC2"

  access_key     = "AKIAQHJYVYOTLTBJKS42"
  secret_key     = "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"
  services_names = ["Servidor Proxy SITE24X7 v3"]

  #Diligenciar aqui los datos necesarios para levantar un server con VPC ya existente
  ami            = "ami-08c988e452afb8d22" # DLM_policy-08082cc816954f750_i-059f41458936dcc54_05.01.2025T03.43.43.503 UTC
  Intance_type   = "t3a.micro"             # Tamanio o tipo de instancias
  subnet_id      = "subnet-18009d75"       # id de la subnet en la que se lanzará
  Security_group = ["sg-e0c93b8f"]         # grupo de seguridad que se asociará a la instancia
  key_name       = "SiteScope"             # par de llaves que usará la instancia

  # volumen raiz del recurso
  volume_type = "gp3"
  volume_size = "20"
}


module "module_1_DEV" {
  source = "./module_1/EC2"

  access_key     = "AKIAQHJYVYOTLTBJKS42"
  secret_key     = "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"
  services_names = ["Servidor Proxy SITE24X7 v1"]

  #Diligenciar aqui los datos necesarios para levantar un server con VPC ya existente
  ami            = "ami-08c988e452afb8d22" # DLM_policy-08082cc816954f750_i-059f41458936dcc54_05.01.2025T03.43.43.503 UTC
  Intance_type   = "t3a.small"             # Tamanio o tipo de instancias
  subnet_id      = "subnet-18009d75"       # id de la subnet en la que se lanzará
  Security_group = ["sg-e0c93b8f"]         # grupo de seguridad que se asociará a la instancia
  key_name       = "SiteScope"             # par de llaves que usará la instancia

  # volumen raiz del recurso
  volume_type = "gp3"
  volume_size = "20"
}

##output modulo 1 QA
output "module_1_QA_ip_addr" {
  value       = module.module_1_QA.instance_ip_addr
  sensitive   = false
  description = "description"
}
output "module_1_QA_ip_addr_pub" {
  value       = module.module_1_QA.instance_ip_addr_pub
  sensitive   = false
  description = "description"
}

## output modulo 1 DEV
output "module_1_DEV_ip_addr" {
  value       = module.module_1_DEV.instance_ip_addr
  sensitive   = false
  description = "description"
}
output "module_1_DEV_ip_addr_pub" {
  value       = module.module_1_DEV.instance_ip_addr_pub
  sensitive   = false
  description = "description"
}