resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "The security group for web server"
  vpc_id      = var.vpc_id

  ingress {
    description = "allow ssh from home"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.home_cidr_blocks
  }

  ingress {
    description = "allow http from every where"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow https from every where"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "webserver"
  }
}

resource "aws_security_group" "database" {
  name        = "database"
  description = "The security group for database"
  vpc_id      = var.vpc_id

  ingress {
    description     = "allow connection from webserver"
    from_port       = var.database_port
    to_port         = var.database_port
    protocol        = "tcp"
    security_groups = ["${aws_security_group.webserver.id}"]
    self            = false
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "database"
  }
}