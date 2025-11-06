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

# calling module

module "my-sdas-module-ec2" {
    source = "./modules/ec2"
    sdas-ami-id="ami-0a25a306450a2cba3"
    vm-size-sd="t2.nano"
    vm-name="sdas-vmnew"
    ec2-key-name="sdas-day3-key"
    my-vpc-id="vpc-02d56e9aa1ce2f114"
    my-sec-group-name="sdas-security-group-name"
    key_size=4096
    key_algo="RSA"
    number_of_vm = 2
}