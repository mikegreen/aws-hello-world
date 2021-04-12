terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.3.0"
    }
  }
}


provider "aws" {
  region = "us-east-2"
  // profile = "hashicorp"
}


module "ec2-example-github-ref" {
  source = "../modules/ec2_cluster"
  //  source = "github.com/mikegreen/aws-hello-world.git//modules/ec2_cluster?ref=0.2"

  sg_id = [module.security-group-web-servers.this_security_group_id]
  //sg_id = ["sg-1234"] //module.security-group-web-servers.this_security_group_id
}

module "security-group-web-servers" {
  source = "../modules/security_group"
  //  source = "github.com/mikegreen/aws-hello-world.git//modules/security_group"
}

