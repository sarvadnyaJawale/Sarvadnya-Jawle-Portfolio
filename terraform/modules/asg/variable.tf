# modules/asg/variables.tf

variable "name" {
  description = "Name of the Auto Scaling Group"
  type        = string
  default     = "Portfolio-eks-ng-alb-asg"
}

variable "launch_template_id" {
  description = "Launch template ID for the ASG"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs where the ASG will launch instances"
  type        = list(string)
}

variable "target_group_arns" {
  description = "List of ALB Target Group ARNs to attach to the ASG"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum number of instances in the ASG"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances in the ASG"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the ASG"
  type        = number
}

variable "dependencies" {
  description = "List of dependencies to ensure correct creation order"
  type        = list(any)
  default     = []
}
