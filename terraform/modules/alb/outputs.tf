output "app_lb" {
  value = aws_lb.app_lb.id
}
output "app_lb_dns" {
  value = aws_lb.app_lb.dns_name
}
output "app_lb_zone_id" {
  value = aws_lb.app_lb.zone_id
}
output "app_lb_tg_arn" {
  value = aws_lb_target_group.app_tg.arn
}