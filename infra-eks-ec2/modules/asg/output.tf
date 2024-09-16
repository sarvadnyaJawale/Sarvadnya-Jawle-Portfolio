# modules/asg/outputs.tf

output "asg_name" {
  description = "The name of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.name
}

output "asg_arn" {
  description = "The ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.arn
}

output "asg_id" {
  description = "The ARN of the Auto Scaling Group"
  value       = aws_autoscaling_group.asg.id
}


