resource "aws_spot_instance_request" "instance" {
  ami                  = data.aws_ami.ami.image_id
  spot_price           = data.aws_ec2_spot_price.spot_price
  instance_type        = var.INSTANCE_TYPE
  wait_for_fulfillment = true

  tags = {
    Name = local.TAG_PREFIX
  }
}

