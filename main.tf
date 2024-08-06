data "aws_vpc" "default_vpc" {
  default = true
}

##################
# Security Group #
##################
module "aws_security_groups" {
  source           = "./modules/aws_security_groups"
  vpc_id           = data.aws_vpc.default_vpc.id
  database_port    = var.db_port
  home_cidr_blocks = var.sg_whitelisted_pub_ips
}

##################
# EC2            #
##################
module "aws_ec2_server" {
  source                      = "./modules/aws_ec2_server"
  ami_id                      = var.ec2_image_id
  os                          = var.ec2_os

  webserver_security_group_id = "${module.aws_security_groups.webserver_seurity_group_id}"
}

##################
# RDS            #
##################
module "aws_rds" {
  source                      = "./modules/aws_rds"
  rds_name                    = var.db_rds_name
  database_name               = var.db_database_name
  database_engine             = var.db_engine
  database_security_group_ids = ["${module.aws_security_groups.database_seurity_group_id}"]
  database_master_username    = var.db_master_username
  database_engine_version     = var.db_engine_version
}

output "private_key" {
  value = module.aws_ec2_server.private_key
  sensitive = true
}

output "db_password" {
  value = module.aws_rds.db_password
  sensitive = true
}