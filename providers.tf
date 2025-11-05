terraform {

  backend "s3" {
    bucket = "sdas-roche-terraform-bucket"
    key = "dev/sdas/terraform.tfstate"
    dynamodb_table = "sdas-roche-table1"
    region = "ap-southeast-2"
    encrypt = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # region location info
  region = "ap-southeast-2"
}
