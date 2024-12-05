terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.58.0"
    }    
  }

  cloud {
    organization = "DevopsKitchenWorkshop"

    workspaces {
      name = "TRANS_workspace"
      project = "Automate_Transitgateway_deploy"
    }
   }
}
# Configure aws provider
provider "aws" {
  region = "us-east-1"
}
