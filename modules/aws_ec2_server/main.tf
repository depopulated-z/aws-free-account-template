locals {
  image_map = {
    ubuntu = "ami-060e277c0d4cce553" # Ubuntu Server 24.04 LTS (HVM), SSD Volume Type
    linux  = "ami-009c9406091cbd65a" # Amazon Linux 2023 AMI
    debian = "ami-0c185732ad1b6169b" # Debian 12 (HVM), SSD Volume Type
  }
}

data "aws_ami" "image" {
  most_recent = true
  owners      = [ "amazon" ]
}

resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "maintainer_key" {
  key_name   = "maintainer-key"
  public_key = tls_private_key.ssh_key.public_key_openssh
}

resource "aws_instance" "server" {
  ami                    = try(var.ami_id, local.local.image_map[var.os])
  instance_type          = var.instance_type

  vpc_security_group_ids = ["${var.webserver_security_group_id}"]
  key_name               = aws_key_pair.maintainer_key.key_name
}
