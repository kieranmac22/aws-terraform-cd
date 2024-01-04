output "rds_endpoint" {
  description = "The endpoint of the MySQL RDS instance"
  value       = aws_db_instance.my_rds_instance.endpoint
}

output "ec2_instance_public_ips" {
  description = "Public IPs of the EC2 instances"
  value       = aws_instance.web_servers[*].public_ip
}

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "subnet_ids" {
  description = "IDs of the subnets used for RDS and EC2 instances"
  value       = module.network.subnet_ids
}