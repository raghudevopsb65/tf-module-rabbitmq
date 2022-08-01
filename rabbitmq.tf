resource "aws_spot_instance_request" "instance" {
  ami                    = data.aws_ami.ami.image_id
  spot_price             = data.aws_ec2_spot_price.spot_price.spot_price
  instance_type          = var.INSTANCE_TYPE
  wait_for_fulfillment   = true
  subnet_id              = var.PRIVATE_SUBNET_IDS[0]
  vpc_security_group_ids = [aws_security_group.main.id]

  tags = {
    Name = local.TAG_PREFIX
  }
}

resource "aws_ec2_tag" "name-tag" {
  resource_id = aws_spot_instance_request.instance.spot_instance_id
  key         = "Name"
  value       = local.TAG_PREFIX
}

