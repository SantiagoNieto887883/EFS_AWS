## provider ##

provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAQHJYVYOTMO4J6GDP"
  secret_key = "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"

}


locals {
  extra_tag = "extra-tag"
}

## resource ##

resource "aws_instance" "test_terraform" {
  #Recursos principales
  #AMI que desplegará
  ami = "ami-0440d3b780d96b29d"
  #Tipo de instancia
  instance_type = "t2.micro"
  #ID de la subnet
  subnet_id = "subnet-002b64e875dc8ce87"

  #Etiquetas de los recursos
  tags = {
  Name = "EC2-TEST-TERRAFORM" }
}