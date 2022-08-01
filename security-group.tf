resource "aws_security_group" "main" {
  name        = "${local.TAG_PREFIX}-sg"
  description = "${local.TAG_PREFIX}-sg"
  vpc_id      = var.VPC_ID

  ingress {
    description = "RABBITMQ"
    from_port   = var.PORT
    to_port     = var.PORT
    protocol    = "TCP"
    cidr_blocks = var.ALLOW_SG_CIDR
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = [var.WORKSTATION_IP]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.TAG_PREFIX}-sg"
  }
}
