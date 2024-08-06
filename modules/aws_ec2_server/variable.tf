variable ami_id {
  description = "ami id for the ec2 instance"
  type        = string
}

variable "os" {
  description = "The OS of the ec2 instance"
  type        = string
  default     = "ubuntu"

  validation {
    condition = contains(["ubuntu", "linux", "debian"], var.os)
    error_message = "currently OS must be one of the follows: ubuntu, linux or debian"
  }
}

variable instance_type {
  description = "type of the instance, by default should be t2."
  type        = string
  default     = "t2.micro" # free tier
}

variable webserver_security_group_id {
  description = "the security group id of the webserver"
  type        = string
}
