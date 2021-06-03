variable "ami" {
type = map
default = {
"us-east-1" = "ami-0d5eff06f840b45e9"
}
}
variable "subnet_id" {
}

variable vpc_security_group_ids{
}

variable region{
default = "us-east-1"
}

variable instance_type{
} 
