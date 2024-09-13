# Define input variables for EKS cluster

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "portfolio-eks-cluster"
}

# variable "region" {
#   description = "The AWS region to deploy the EKS cluster"
#   type        = string
#   default     = "ap-south-1"
# }

variable "private_subnets" {
  description = "List of private subnets for the EKS cluster"
  type        = list(string)
}

# variable "instance_types" {
#   description = "List of instance types for the node groups"
#   type        = list(string)
#   default     = ["t2.medium"]
# }


variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {
    Environment = "Portfolio"
  }
}

variable "ami_type" {
  description = "AMI type for the node group instances"
  type        = string
  default     = "ami-0522ab6e1ddcc7055"  #  Here Change it to Ubuntu Img
}