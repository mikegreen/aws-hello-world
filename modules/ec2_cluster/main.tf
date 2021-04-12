variable "sg_id" {
  type = list(any)
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 2

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
