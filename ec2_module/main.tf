resource "aws_instance" "myecpub" {
  count                  = 2
  instance_type          = var.instance_type
  ami                    = lookup(var.ami, var.region)
  subnet_id              = element(var.subnet_id,count.index)
  vpc_security_group_ids = [var.vpc_security_group_ids, ]
  key_name               = aws_key_pair.deployer.key_name
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file("/home/ec2-user/.ssh/authorized_keys")
}

output "myec2output"{
value=aws_instance.myecpub.*.id
}
