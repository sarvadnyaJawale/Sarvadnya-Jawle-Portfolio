resource "aws_launch_template" "ec2-lt" {
  name_prefix   = "portfolio-eks-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     =  base64encode(<<-EOF
   #!/bin/bash
    # Update the package list and install Docker
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    
    # Start Docker and enable it to run on startup
    sudo systemctl start docker
    sudo systemctl enable docker
    
    # Add the ubuntu user to the docker group to run docker without sudo
    sudo usermod -aG docker ubuntu
    
    # Pull the Docker image sarvadnya/portfolio:v1.0.4
    sudo docker pull sarvadnya/portfolio:v1.0.4
    
    # Run the Docker container with the pulled image
    sudo docker run -d -p 80:80 sarvadnya/portfolio:v1.0.4
  EOF
  )
  # network_interfaces {
  #   associate_public_ip_address = true
  # }


  # it's my thought for dynamically provisioning the private subnets
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.ssh_http_sg]
    subnet_id                   =  var.private_subnets[0]
    device_index                = 0 
    network_card_index          = 0   
  }
  
  # ChatGpt's way 
  // Use dynamic block to iterate over the private subnets
  # dynamic "network_interfaces" {
  #   for_each = toset(var.private_subnets)  # Convert the list to a set to iterate
  #   content {
  #     associate_public_ip_address = false
  #     security_groups             = [var.eks_ng_security_group]
  #     subnet_id                   = network_interfaces.value # Use the subnet ID dynamically
  #   }
  # }
  
  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Portfolio-eks-node"
    }
  }
}
