# Define input variables for Route 53 setup

variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
  default     = "sarvadnya.tech"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Portfolio-ec2-domain"
  }
}
variable "app_lb_dns" {}
variable "app_lb_zone_id" {}
