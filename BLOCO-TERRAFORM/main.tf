terraform {
  required_version = "1.3.0" 
  # O required_version pode aparecer das seguintes formas:
  # "=1.3.0"
  # ">=1.0.0, < 1.3.0" - a vírgula significa "até"
  # "> 1.0.0", 
  # "!= 1.0.0"
  # "~> 1.0.0" - o ~ significa de 1.0.0 até 1.0.n
  required_providers {
    aws = {
        # configuração do provider
    }
  }
}

provider "aws" {
  
}

resource "aws_instance" "vm1" {
  
}

data "aws_ami" "image" {
  
}

module "network" {
  
}

variable "vm_name" {
  
}

output "vm1_ip" {
  
}

locals {
  
}

