terraform {
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

# define 2nd container via map, could be done with a module as well
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

# define 2 container definitions, the second being from the local object above
locals {
  defs = [
    {
      name      = "first"
      image     = "service-first"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    },
    # add additional container from the module
    local.second-service-definition
  ]
}

# create the task definition with the 2 containers
resource "aws_ecs_task_definition" "service-testing" {
  family                = "service-testing"
  container_definitions = jsonencode(local.defs)
}


