variable rds_name {
  description = "name of the RDS instance"
  type        = string
}

variable database_name {
  description = "database name to be created when the RDS is spinned up"
  type        = string
}

variable database_security_group_ids {
  description = "database security group ids"
  type        = list(string)
}

variable database_master_username {
  description = "database master username"
  type        = string
}

variable database_instance_class {
  description = "database storage class"
  type        = string
  default     = "db.t3.micro" # hardcoded here because its free tier
}

variable database_storage_type {
  description = "database storage type"
  type        = string
  default     = "gp2"
}

variable database_engine {
  description = "database engine"
  type        = string
}

variable database_engine_version {
  description = "database engine version"
  type        = string
}