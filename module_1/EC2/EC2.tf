locals {
  extra_tag = "extra-tag"
  tag_test = "test_1"
}

  #IAM ROLE
  data "aws_iam_role" "recurso_1" {
  name = "SSM-EC2-ROLE"
}
## resource ##

resource "aws_instance" "recurso_1" {
  #Recursos principales
  for_each = var.services_names
  
  ami = var.ami #ami que usa la instacia declarada en variables.tf
  instance_type = var.Intance_type #Tipo de instancia declarada en variables.tf
  subnet_id = var.subnet_id #ID de la subnet declarada en variables.tf
  associate_public_ip_address = true #auto asignar ip publica
  vpc_security_group_ids = var.Security_group #Grupo de seguridad de la vpc ya creada declarada en variables.tf
  key_name = var.key_name
  
  #IAM ROL
  iam_instance_profile = data.aws_iam_role.recurso_1.name
  
  #Etiquetas de los EC2
  tags = {
    extra_tag = local.extra_tag
    extra_tag = local.tag_test
    Name = "EC2-${each.key}"
     }

    
             
 #definir volumen al recurso 
 root_block_device {
    volume_type = var.volume_type    # tipo de disco
    volume_size = var.volume_size       # Tamaño en GB
    delete_on_termination = true     # Eliminar al destruir la instancia
  tags = {
    Name = "Volumen-${each.key}"
  }
  }
  # agregar volumen adicional
  #ebs_block_device {
   # volume_type           = "gp3"    # tipo de disco
    #volume_size           = 10       # Tamaño en GB
    #device_name           = "/dev/xvdb" # Nombre del dispositivo para volumen de datos
    #delete_on_termination = true     # Eliminar al destruir la instancia
  #tags = {
   # Name = "EC2-TEST-TERRAFORM_VOLUMEN_DATOS"
  #}
  #}

  #Datos de USER DATA (se usan para instalar al inicio de un server)
    user_data = <<-EOF
             #!/bin/bash
            sudo yum install -y nginx
            sudo systemctl enable nginx
            sudo systemctl start nginx
            EOF
}