# Main configuration for Route 53 DNS records and hosted zone

# Create Route 53 Hosted Zone
resource "aws_route53_zone" "main" {
  name = var.domain_name
  tags = var.tags
}

# ALB DNS Record in Route 53
resource "aws_route53_record" "app_alb" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = var.app_lb_dns
    zone_id                = var.app_lb_zone_id
    evaluate_target_health = true
  }
}

# Optionally, add a CNAME or additional records if needed
# CNAME Record Example
resource "aws_route53_record" "www_alias" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = [aws_route53_record.app_alb.name]
}
