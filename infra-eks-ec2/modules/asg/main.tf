resource "aws_autoscaling_group" "asg" {
  name                 = var.name
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = var.launch_template_id
    version = "$Latest"
  }

  # Attach target groups directly in the ASG resource
  target_group_arns         = [var.target_group_arns]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                     = "Name"
    value                   = var.name
    propagate_at_launch     = true
  }

  lifecycle {
    create_before_destroy   = true
  }

}
