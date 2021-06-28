# modules/second-service/main.tf

variable "name" {
  type    = string
  default = "second"
}

variable "cpu" {
  type    = number
  default = 10
}

variable "port" {
  type    = number
  default = 443
}

locals {
  second-service-definition = {
    name      = var.name
    image     = "service-second"
    cpu       = var.cpu
    memory    = 512
    essential = true
    portMappings = [
      {
        containerPort = var.port
        hostPort      = var.port
      }
    ]
  }
}


output "second-service-definition" {
  value = local.second-service-definition
}

