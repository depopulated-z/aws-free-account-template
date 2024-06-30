variable ami_id {
  description = "ami id for the ec2 instance"
  type        = string
}

variable instance_type {
  description = "type of the instance, by default should be t2."
  type        = string
  default     = "t2.micro"
}

variable webserver_security_group_id {
  description = "the security group id of the webserver"
  type        = string
}
