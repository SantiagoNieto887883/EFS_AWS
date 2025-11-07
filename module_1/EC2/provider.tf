## provider ##
provider "aws" {
region     = "us-east-1"

##pendiente por encriptar
  access_key = var.access_key
  secret_key = var.secret_key

}