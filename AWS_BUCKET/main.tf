terraform {
  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "default"
  default_tags {
    tags = {
      owner      = "pcamposaugusto"
      managed-by = "terraform"
    }
  }
}