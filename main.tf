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
  ami           = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  subnet_id = "subnet-002b64e875dc8ce87"
  tags = {
    Name = "EC2-TEST-TERRAFORM" }
}