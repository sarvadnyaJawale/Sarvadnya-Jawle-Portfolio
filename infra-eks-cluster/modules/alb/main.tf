# Target Group for ALB
resource "aws_lb_target_group" "app_tg" {
  name        = "eks-app-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"  # Use "ip" type for EKS nodes or "instance" for EC2 instances

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200"
  }

  tags = {
    Name = "tf-eks-app-tg"
  }
}
# ALB (Application Load Balancer)
resource "aws_lb" "app_lb" {
  name               = "eks-app-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group]
  subnets            = [var.public_subnet_a1 ]  # Public subnets # we should create only one public subnet

  tags = {
    Name = "tf-eks-app-lb"
  }
}

# ALB Listener
resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
# ALB Target Group Attachment using Auto Scaling Group, 
# resource "aws_autoscaling_attachment" "asg_tg_attachment" {
#   autoscaling_group_name     = aws_eks_node_group.eks_node_group.resources[0].autoscaling_group_name
#   target_group_arn           = aws_lb_target_group.app_tg.arn
# }


