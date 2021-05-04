variable "environment" {
  type = string
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.17"

  name = "my-cluster"

  // if we're in dev, just make a cluster of 1, otherwise 3
  instance_count = var.environment == "dev" ? 1 : 3

  ami                    = "ami-0b3192b6308bb1b49"
  instance_type          = "t2.micro"
  key_name               = "mike.green"
  monitoring             = false
  vpc_security_group_ids = var.sg_id
  subnet_id              = "subnet-23150869"

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "mike.green"
  }
}
