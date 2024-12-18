terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.60.0" // Make sure this version exists
    }
  }

    # backend "s3" {
    # bucket = "sky-s3-main10"
    # key    = "terraform/states/frogtech-TG/terraform.tfstate"
    # region = "us-east-1"
    # encrypt = true
    # }

  cloud {
    organization = "DevopsKitchenWorkshop"

    workspaces {
      name = "TRANS_workspace"
    }
   }
}
# Configure aws provider
provider "aws" {
  region = "us-east-1"
}
