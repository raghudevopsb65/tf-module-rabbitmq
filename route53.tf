resource "aws_route53_record" "rabbitmq" {
  zone_id = var.PRIVATE_ZONE_ID
  name    = "rabbitmq-${var.ENV}"
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.instance.private_ip]
}

