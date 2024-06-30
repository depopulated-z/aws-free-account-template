variable vpc_id {
  description = "id of the vpc that our servers will be located in"
  type        = string
}

variable home_cidr_blocks {
  description = "the cidr block for our home ip addresses"
  type        = list(string)
}

variable database_port {
  description = "the port opened for database"
  type        = number
}