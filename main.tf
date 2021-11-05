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
  # default_test_thing {
  #   # This tests if a new, unknown tag appears will it bark
  #   foo="foo"
  # }

  default_tags {
    tags = {
      tag01 = "default_tag01"
      tag02 = "Ops"
    }
  }
}

resource "aws_instance" "ec2-example" {
   instance_type = "t2.micro"
   ami           = "ami-09558250a3419e7d0"
   tags = {
     Name  = "mike.green example ec2"
     tag01 = "resource-specific-changed-back"
   }
 }


