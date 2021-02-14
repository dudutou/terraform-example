terraform {
  backend "remote" {
    organization = "miwa"
    workspaces {
      name = "aws-with-tf"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0e999cbd62129e3b1"
  instance_type = "t2.micro"
  tags = {
    name = "terraform_test"
  }
}

