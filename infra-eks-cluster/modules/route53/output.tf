# Define outputs for Route 53 configuration

output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone"
  value       = aws_route53_zone.main.zone_id
}

output "route53_alb_record" {
  description = "The DNS name of the ALB record in Route 53"
  value       = aws_route53_record.app_alb.name
}
