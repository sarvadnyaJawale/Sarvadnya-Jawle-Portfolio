
output "cluster_id" {
  description = "The ID of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "node_group_arn" {
  description = "The ARN of the EKS node group"
  value       = aws_eks_node_group.eks_node_group.arn
}

output "node_group_asg_name" {
  description = "The Auto Scaling Group name of the EKS node group"
  value       = aws_eks_node_group.eks_node_group.resources[0].autoscaling_group_name
}

output "node_group_status" {
  description = "The status of the EKS node group"
  value       = aws_eks_node_group.eks_node_group.status
}

output "node_role_arn" {
  description = "The ARN of the IAM role assigned to the EKS node group"
  value       = aws_iam_role.eks_node_role.arn
}
