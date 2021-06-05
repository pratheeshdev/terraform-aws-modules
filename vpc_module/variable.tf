variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "public_subnet" {
  type    = list(any)
  default = ["10.0.2.0/24", "10.0.3.0/24"]

}
variable "azlist" {
  type    = list(any)
  default = ["us-east-1a", "us-east-1b"]
}
