# Variables for the provider configuration
variable "cluster_name" { 
  default = "portfolio-eks-cluster-terraform-configuration"
}
variable "vpc_cidr" {
  default = "10.10.10.10/16"
}
variable "ami_release_version" {
  default = "ami-0522ab6e1ddcc7055"
}