resource "aws_security_group" "sg" {
  for_each = {
    for sg in var.security_groups : sg.name => sg
  }

  name        = "${each.value.name}-security-group"
  description = each.value.description
  vpc_id      = each.value.vpc_id

  dynamic "ingress" {
    for_each = { for key, value in each.value.ingress_rules : key => value if length(value.cidr_blocks) != 0 }
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = { for key, value in each.value.egress_rules : key => value if length(value.cidr_blocks) != 0 }
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
    }
  }

  dynamic "ingress" {
    for_each = { for key, value in each.value.ingress_rules : key => value if length(value.security_groups) != 0 }
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      security_groups = ingress.value.security_groups
    }
  }

  dynamic "egress" {
    for_each = { for key, value in each.value.egress_rules : key => value if length(value.security_groups) != 0 }
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      protocol        = egress.value.protocol
      security_groups = egress.value.security_groups
    }
  }

  tags = {
    Name = "${each.value.name}-sg"
  }
}
