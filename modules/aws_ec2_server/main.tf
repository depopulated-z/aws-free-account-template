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
  ami                    = var.ami_id
  instance_type          = var.instance_type

  vpc_security_group_ids = ["${var.webserver_security_group_id}"]
  key_name               = aws_key_pair.maintainer_key.key_name
}
