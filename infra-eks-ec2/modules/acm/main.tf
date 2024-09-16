# Public ACM Certificate for Domain Validation
resource "aws_acm_certificate" "cert" {
  domain_name       = "sarvadnya.tech"
  validation_method = "DNS"

  tags = {
    Environment = "tf-test"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# DNS Validation Record
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => dvo
  }

  zone_id = var.route53_zone_id  # Replace with your Route 53 zone ID
  name    = each.value.resource_record_name
  type    = each.value.resource_record_type
  ttl     = 60
  records = [each.value.resource_record_value]
}

# Ensure the ACM certificate is validated before it is used
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [
    for record in aws_route53_record.cert_validation : record.fqdn
  ]

  depends_on = [aws_route53_record.cert_validation]
}




