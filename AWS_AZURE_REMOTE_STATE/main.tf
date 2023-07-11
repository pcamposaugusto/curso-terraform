terraform {

  required_version = ">=1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.73.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.57.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
  default_tags {
    tags = {
      owner      = "pcamposaugusto"
      managed-by = "terraform"
    }
  }
}

provider "azurerm" {
  features {

  }
}