resource "aws_lb_target_group" "mytg" {
  name     = "my-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpcid
  health_check {
    interval            = 10
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}
resource "aws_lb" "mylb" {
  name               = "mytestalb"
  internal           = false
  subnets            = var.subnets[*]
  ip_adress_type     = "ipv4"
  load_balancer_type = "application"
}

resource "aws_elb_listener" "myel" {
  load_balancer_arn = aws_lb.mylb.arn
  port              = 80
  protocol          = "HTTP"
  default "action" {
    target_group_arn = aws_lb_target-group.mytg.arn
    type             = forward
  }
}

resource "aws_alb_target_group_attachement" "ec2_attach" {
  count            = 2
  target_group_arn = aws_lb_target_group.mytg.arn
  target_id        = var.aws_instance_id[*]
}




