resource "aws_launch_template" "eks_launch_template" {
  name_prefix   = "portfolio-eks-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }
  # it's my thought for dynamically provisioning the private subnets
  # network_interfaces {
  #   associate_public_ip_address = false
  #   security_groups             = [var.eks_ng_security_group]
  #   subnet_id                   =  var.private_subnets
  # }
  
  # ChatGpt's way 
  // Use dynamic block to iterate over the private subnets
  dynamic "network_interfaces" {
    for_each = toset(var.private_subnets)  # Convert the list to a set to iterate
    content {
      associate_public_ip_address = false
      security_groups             = [var.eks_ng_security_group]
      subnet_id                   = network_interfaces.value # Use the subnet ID dynamically
    }
  }
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Portfolio-eks-node"
    }
  }
}
