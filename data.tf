data "aws_secretsmanager_secret" "secret" {
  name = "roboshop/all"
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

data "aws_ami" "ami" {
  executable_users = ["self"]
  most_recent      = true
  name_regex       = "base-with-ansible"
  owners           = ["self"]
}

data "aws_ec2_spot_price" "spot_price" {
  instance_type     = var.INSTANCE_TYPE
  availability_zone = data.aws_subnet.selected.availability_zone

  filter {
    name   = "product-description"
    values = ["Linux/UNIX"]
  }
}



data "aws_subnet" "selected" {
  id = var.PRIVATE_SUBNET_IDS[0]
}


