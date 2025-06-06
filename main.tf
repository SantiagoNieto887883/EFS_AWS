## provider ##

provider "aws" {
region     = "us-east-1"
##pendiente por encriptar
  access_key = var.access_key
  secret_key = var.secret_key

}


locals {
  extra_tag = "extra-tag"
}

  #IAM ROLE
  data "aws_iam_role" "test_terraform" {
  name = "SSMServiceRole"
}
## resource ##

resource "aws_instance" "test_terraform" {
  #Recursos principales
  for_each = var.services_names
  
  ami = "ami-08c988e452afb8d22" # DLM_policy-08082cc816954f750_i-059f41458936dcc54_05.01.2025T03.43.43.503 UTC
  instance_type = var.Intance_type #Tipo de instancia
  subnet_id = "subnet-18009d75" #ID de la subnet
  associate_public_ip_address = true #auto asignar ip publica
  vpc_security_group_ids = [
    "sg-e0c93b8f" #Grupo de seguridad de la vpc ya creada
    ] 
  key_name = "SiteScope"
  
  #IAM ROL
  iam_instance_profile = data.aws_iam_role.test_terraform.name
  
  #Etiquetas de los recursos
  tags = {
    extra_tag = local.extra_tag
    Name = "EC2-${each.key}"
     }

    #Datos de USER DATA (se usan para instalar al inicio de un server)
    #user_data = <<-EOF
             #!/bin/bash
     #       sudo yum install -y nginx
      #      sudo systemctl enable nginx
       #     sudo systemctl start nginx
        #    EOF
             
 #definir volumen al recurso 
 root_block_device {
    volume_type           = "gp3"    # tipo de disco
    volume_size           = 20       # Tamaño en GB
    delete_on_termination = true     # Eliminar al destruir la instancia
  tags = {
    Name = "Volumen-${each.key}"
  }
  }
  #ebs_block_device {
   # volume_type           = "gp3"    # tipo de disco
    #volume_size           = 10       # Tamaño en GB
    #device_name           = "/dev/xvdb" # Nombre del dispositivo para volumen de datos
    #delete_on_termination = true     # Eliminar al destruir la instancia
  #tags = {
   # Name = "EC2-TEST-TERRAFORM_VOLUMEN_DATOS"
  #}
  #}
}