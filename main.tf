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
  #AMI que desplegará
  ami           = "ami-0440d3b780d96b29d"
  #Tipo de instancia
  instance_type = "t2.micro"
  #ID de la subnet
  subnet_id = "subnet-002b64e875dc8ce87"
 


  
  #Etiquetas de los recursos
  tags = {
    Name = "EC2-TEST-TERRAFORM" }


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