# Target group for public targets 
resource "aws_lb_target_group" "my_tg_a" { 
 name     = "portfolio-tg-alb-ec2"
 port     = 80
 protocol = "HTTP"
 vpc_id   = var.vpc_id

   health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    protocol            = "HTTP"
  }
}

# Create a new ALB Target Group attachment ( Attach ASG to Target Group; whenever asg will make instance it will count as target)
# When you attach a target group to an Auto Scaling Group (ASG), it establishes a link between the two.
# As the ASG launches new EC2 instances, it automatically registers them as targets in the associated target group.
resource "aws_autoscaling_attachment" "public_aws_autoscaling_attachment" {
  autoscaling_group_name = var.public-asg-id
  lb_target_group_arn    = aws_lb_target_group.my_tg_a.arn
}

# By using Auto Scaling Groups, big organizations can dynamically manage and scale EC2 instances(lets try it)
# Create a new load balancer attachment

# resource "aws_lb_target_group_attachment" "tg_attachment_a" { #this will be used when you are manually created ec2 without asg
#  for_each         = { for idx, instance_id in var.ec2_instance_ids : idx => instance_id } #it was ran before using toset(var.instance_ids) && attached ec2 as target
#  target_group_arn = aws_lb_target_group.my_tg_a.arn
#  target_id        = each.value
#  port             = 80
# }

# this approach will work meanwhile, make it more efficient, take list of ec2_ids from module/ec2/output.tf and then use it as input for alb

# resource "aws_lb_target_group_attachment" "tg_attachment_a" {
#  target_group_arn = aws_lb_target_group.my_tg_a.arn
#  target_id        = var.ec2_public_az1
#  port             = 80
# }

# resource "aws_lb_target_group_attachment" "tg_attachment_b" {
#  target_group_arn = aws_lb_target_group.my_tg_a.arn
#  target_id        = var.ec2_public_az2
#  port             = 80
# }


#------------ alb for public instances-------------------
resource "aws_lb" "my_alb_for_ec2" {
 name               = "my-alb"
 internal           = false
 load_balancer_type = "application"
 security_groups    = [var.sg_http_ssh]
 subnets            = [var.public_subnet_az1,var.public_subnet_az2]

 tags = {
   Environment = "dev"
 }
}
// Listener for port 80 (HTTP)
resource "aws_lb_listener" "my_public_alb_listener" {
 load_balancer_arn = aws_lb.my_alb_for_ec2.arn
 port              = "80"
 protocol          = "HTTP"

# Below Action will forward Traffic to HTTP but As We will only serve Traffic which is coming from HTTPS that's why we will Redirect Traffic to HTTPS
 default_action {
   type             = "forward"
   target_group_arn = aws_lb_target_group.my_tg_a.arn 
 }
# # Action to Redirect Traffic to HTTP's
  # default_action {
  #   type             = "redirect"
  #   redirect {
  #     port          = "443"
  #     protocol      = "HTTPS"
  #     status_code   = "HTTP_301"
  #   }
  # }
}

# New HTTPS Listener (Port 443)
# resource "aws_lb_listener" "my_public_alb_listener_https" {
#   load_balancer_arn = aws_lb.my_alb_for_ec2.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   certificate_arn   = var.acm_certificate_arn     # Replace with your ACM certificate ARN

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.my_tg_a.arn
#   }
# }


