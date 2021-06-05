variable "aws_instance_id" {
  type    = list
  default = []
}

variable "subnet_id" {
  type    = list
  default = []
}

variable "azlist" {
  type    = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
