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

## resource ##

resource "aws_instance" "test_terraform" {
  #Recursos principales
  for_each = var.services_names
  
  ami = "ami-0440d3b780d96b29d" #AMI que desplegará
  instance_type = "t2.micro" #Tipo de instancia
  subnet_id = "subnet-002b64e875dc8ce87" #ID de la subnet
  vpc_security_group_ids = [
    "sg-07761326d17d71a6b",
    "sg-0d75970ad9cf93a0c",
    "sg-0df20cd1992b2472b",
    "sg-01adbaa8efd1fbdc3"
    ] #Grupo de seguridad de la vpc ya creada
  
  
  #Etiquetas de los recursos
  tags = {
    extra_tag = local.extra_tag
    Name = "EC2-${each.key}"
     }


    #Datos de USER DATA (se usan para instalar al inicio de un server)
    user_data = <<-EOF
             #!/bin/bash
            sudo yum install -y nginx
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF
             
 #definir volumen al recurso 
 root_block_device {
    volume_type           = "gp3"    # tipo de disco
    volume_size           = 20       # Tamaño en GB
    delete_on_termination = true     # Eliminar al destruir la instancia
  tags = {
    Name = "EC2-TEST-TERRAFORM"
  }
  }
  ebs_block_device {
    volume_type           = "gp3"    # tipo de disco
    volume_size           = 10       # Tamaño en GB
    device_name           = "/dev/xvdb" # Nombre del dispositivo para volumen de datos
    delete_on_termination = true     # Eliminar al destruir la instancia
  tags = {
    Name = "EC2-TEST-TERRAFORM_VOLUMEN_DATOS"
  }
  }
}