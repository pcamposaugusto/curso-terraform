terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
  }

  backend "s3" {
    bucket = "curso-terraform-pcamposaugusto"
    key    = "aws-vm/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "pcamposaugusto"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "curso-terraform-pcamposaugusto"
    key    = "aws-vpc/terraform.tfstate"
    region = "us-east-1"
  }
}

# dps de subir a máquina, colocar esse comando no terminal:
# ssh -i nomeChave nomeUsuario@ip
# ssh -i aws-key.pub ubuntu@ip-da-vm