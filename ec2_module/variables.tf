variable "ami" {
  type = map(any)
  default = {
    "us-east-1" = "ami-0c03640957628e3b8"
  }
}
variable "subnet_id" {
  type = list(any)
}

variable "vpc_security_group_ids" {
}

variable "region" {
  default = "us-east-1"
}

variable "instance_type" {
default="t2.micro"
}
