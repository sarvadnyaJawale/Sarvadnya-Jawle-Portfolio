output "alb_security_group" {
  value = aws_security_group.alb_security_group.id
}
output "eks_ng_security_group" {
  value = aws_security_group.eks_node_security_group.id
}
output "ssh_http_sgs" {
  value = aws_security_group.http_ssh_sg.id
}