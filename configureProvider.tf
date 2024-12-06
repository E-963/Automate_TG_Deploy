terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }

    # backend "s3" {
    # bucket = "sky-s3-main10"
    # key    = "terraform/states/frogtech-TG/terraform.tfstate"
    # region = "us-east-1"
    # encrypt = true
    # }

  # cloud {
  #   organization = "DevopsKitchenWorkshop"

  #   workspaces {
  #     name = "TRANS_workspace"
  #     project = "Automate_Transitgateway_deploy"
  #   }
  #  }
}
# Configure aws provider
provider "aws" {
  region = "us-east-1"
  profile = "default"
}
