output "app_lb" {
  value = aws_lb.my_alb_for_ec2.id
}
output "app_lb_dns" {
  value = aws_lb.my_alb_for_ec2.dns_name
}
output "app_lb_zone_id" {
  value = aws_lb.my_alb_for_ec2.zone_id
}
output "app_lb_tg_arn" {
  value = aws_lb_target_group.my_tg_a.arn
}