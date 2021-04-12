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
  source = "github.com/mikegreen/aws-hello-world.git//modules/ec2_cluster?ref=0.2"

  sg_id = module.security-group-web-servers.this_security_group_id
}

module "security-group-web-servers" {
  source = "github.com/mikegreen/aws-hello-world.git//modules/security_group"
}

