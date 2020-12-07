terraform {
  backend "remote" {
    organization = "hashicorp"

    workspaces {
      name = "aws-hello-world"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

}


provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2-example" {
  instance_type = "t2.micro"
  ami           = "ami-09558250a3419e7d0"
}
