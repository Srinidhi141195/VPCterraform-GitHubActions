terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }

  backend "s3" {
    bucket = "srinidhi-acharla-14111995-sterraform"
    key    = "dev/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "aws" {
  region = "us-east-2"
}