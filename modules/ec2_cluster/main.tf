variable "sg_id" {
  type = list(any)
}

module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 2.0"

  name           = "my-cluster"
  instance_count = 2

  ami                    = "ami-ebd02392"
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = false
  vpc_security_group_ids = var.sg_id
  subnet_id              = "subnet-079a2a640910b738d"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
