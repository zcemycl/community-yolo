resource "aws_vpc" "base_vpc" {
  cidr_block           = var.base_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "vpc"
  }
}

module "security_groups" {
  source = "../../modules/security_groups"
  security_groups = [
    {
      name        = "public"
      description = "public security group"
      vpc_id      = aws_vpc.base_vpc.id
      ingress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          security_groups = []
          from_port       = 22
          to_port         = 22
          protocol        = "tcp"
        }
      ]

      egress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          security_groups = []
          from_port       = 0
          to_port         = 0
          protocol        = "-1"
        }
      ]
    }
  ]
}

module "security_groups_after" {
  source = "../../modules/security_groups"
  security_groups = [
    {
      name        = "private"
      description = "private security group"
      vpc_id      = aws_vpc.base_vpc.id
      ingress_rules = [
        {
          cidr_blocks = []
          security_groups = [
            module.security_groups.security_groups["public"].id
          ]
          from_port = 0
          to_port   = 0
          protocol  = "-1"
        }
      ]

      egress_rules = [
        {
          cidr_blocks     = ["0.0.0.0/0"]
          security_groups = []
          from_port       = 0
          to_port         = 0
          protocol        = "-1"
        }
      ]
    }
  ]
}
