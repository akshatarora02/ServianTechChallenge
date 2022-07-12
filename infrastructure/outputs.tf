output "alb_dns_name" {
  description = "public accessible url to access application"
  value       = aws_lb.app.dns_name
}

output "standalone_task_subnet" {
  description = "single subnet to run standalone ECS Task to config db"
  value       = data.aws_subnets.available.ids[0]
}

output "standalone_task_sg" {
  description = "security group to run standalone ECS Task to config db"
  value       = aws_security_group.app.id
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.app.name
}

output "environment_name" {
  description = "Environment Name"
  value       = var.environment_name
}
