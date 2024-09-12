# Define input variables for Route 53 setup

variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone"
  type        = string
  default     = "Sarvadnya-Jawle"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Portfolio"
  }
}
variable "app_lb_dns" {}
variable "app_lb_zone_id" {}
