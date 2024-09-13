resource "aws_launch_template" "eks_launch_template" {
  name_prefix   = "portfolio-eks-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = var.instance_profile_name
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.eks_node_sg.id]
    subnet_id                   = element(var.eks_ng_security_group, 0) # Example, should be dynamic
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Portfolio-eks-node"
    }
  }
}
