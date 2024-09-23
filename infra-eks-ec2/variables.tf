# Variables for the provider configuration
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"                  # Set your default region
}
# Uncomment if using static credentials
variable "aws_access_key" {
  description = "AWS access key."
  type        = string
  sensitive   = true
}

variable "aws_secret_key" {
  description = "AWS secret key."
  type        = string
  sensitive   = true
}
