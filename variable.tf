variable "db_port" {
  type        = number
  description = "Port number of the database"
  default     = 5432
}

variable "sg_whitelisted_pub_ips" {
  type        = list(string)
  description = "A list of public IPs to be whitelisted to access server / db"
}

variable "ec2_image_id" {
  type        = string
  description = "The image id of the EC2 instance"
}

variable "db_database_name" {
  type        = string
  description = "Name of the database in the RDS instance" 
}

variable "db_rds_name" {
  type        = string
  description = "Name of the RDS instance"
}

variable "db_master_username" {
  type        = string
  description = "The master username of the database"
}

variable "db_engine_version" {
  type        = string
  description = "Engine version of the db"
}

variable "db_engine" {
  type        = string
  description = "Type of the DB engine. E.g. MySQL, Postgres"
}