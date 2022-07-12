variable "environment_name" {
  description = "environment name is used as a prefix to avoid confusion between different environment resources."
  default     = "servian-tech-challenge"
}

variable "vpc_id" {
  description = "VPC to deploy application stack"
}

variable "postgresql_version" {
  description = "PostgreSQL version to be used"
  default = "14.3"
}

variable "postgresql_password" {
  description = "PostgreSQL database password"
  sensitive   = true
}

variable "postgresql_instance_class" {
  description = "PostgreSQL database instance class"
  default     = "db.t3.medium"
}

variable "container_image" {
  description = "Application container image tag"
  default     = "servian/techchallengeapp:latest"
}

variable "certificate_arn" {
  description = "Regional certificate ARN to be used by the load balancer"
  default     = ""
}

