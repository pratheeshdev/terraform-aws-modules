resource "aws_instance" "myecpub" {
  instance_type          = var.instance_type
  ami                    = lookup(var.ami, var.region)
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids, ]
}
