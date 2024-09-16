variable "ssh_http_sg" {}
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

variable "private_subnets" {
  
}