module "sg-example" {
  source  = "terraform-aws-modules/security-group/aws//modules/http-80"
  version = "~> 3.18"

  name        = "web-server"
  description = "Security group for web-server with HTTP ports open within VPC"
  vpc_id      = "vpc-d3d309ba"

  ingress_cidr_blocks = ["10.10.0.0/16"]
}

output "this_security_group_id" {
  description = "The ID of the security group"
  value       = module.sg-example.this_security_group_id
}
