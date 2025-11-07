terraform {
  required_version = ">= 1.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  # SIN backend aquí (lo pasarás en terraform init -backend-config=...)
  backend "s3" {}
}

provider "aws" {
  region  = var.aws_region
  profile = var.profile
  #profile = "Proinnovate"
  

  default_tags {
    tags = {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  }
}
