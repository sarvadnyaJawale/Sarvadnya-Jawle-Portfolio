provider "aws" {
  region = "ap-south-1"  # Change to your AWS region
}

data "aws_vpc" "existing_vpc" {
  id = "vpc-xxxxxxxx"  # Replace with your VPC ID created by eksctl
}

resource "aws_vpclattice_service_network" "service-network" {
  name      = "portfolio-serv-net"
}

resource "aws_vpclattice_service" "example" {
  name               = "port-service"
}

resource "aws_vpclattice_service_network_service_association" "example" {
  service_identifier         = aws_vpclattice_service.example.id
  service_network_identifier = aws_vpclattice_service_network.service-network.id
}

resource "aws_vpclattice_route" "portfolio_http_route" {
  service_network_arn = aws_vpclattice_service_network.portfolio_service_network.arn
  service_arn         = aws_vpclattice_service.portfolio_service.arn
  destination_cidr_block = "0.0.0.0/0"  # Adjust if necessary
  route_type = "HTTP"
}

