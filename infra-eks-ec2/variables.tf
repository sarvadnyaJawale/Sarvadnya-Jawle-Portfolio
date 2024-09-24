# Variables for the provider configuration
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  type        = string
  default     = "ap-south-1"                  # Set your default region
}
# Uncomment if using static credentials
# in production we assign iam roles to ec2 that hosting terraform rather than providing a key to resoures 
