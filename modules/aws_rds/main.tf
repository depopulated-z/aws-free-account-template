resource "random_password" "db_password" {
  length = 16
  special = true
  override_special = "!#$@&"
}

resource "aws_db_instance" "database" {
  identifier             = var.rds_name
  db_name                = var.database_name
  storage_type           = var.database_storage_type
  instance_class         = var.database_instance_class
  vpc_security_group_ids = var.database_security_group_ids
  engine                 = var.database_engine
  engine_version         = var.database_engine_version
  username               = var.database_master_username
  password               = random_password.db_password.result

  # hard code here because we have a limit of 20 GB.
  allocated_storage      = 18
}
