variable "eks_ng_security_group" {}
variable "ami_id" {
    description = "Ubuntu 22.04 image"
    type        = string
    default     = "ami-0522ab6e1ddcc7055"
}
variable "instance_type" {
    description = "Ubuntu 22.04 image"
    type        = string
    default     = "t2.medium"
}
variable "instance_profile_name" { 
    description = "lt for AutoScaling Group, those will autoscale Nodes of Eks cluster"
    type        = string
    default     = "Portfolio-eks-ng-lt"  
}
variable "private_subnets" {
  
}