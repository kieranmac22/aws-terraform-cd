# RDS MySQL Configuration

# Custom db parameter group based on MySQL with InnoDB buffer pool size
resource "aws_db_parameter_group" "tf_db_parameter_group" {
  name        = "tf-db-parameter-group"
  family      = "mysql5.7"
  description = "Custom parameter group for workload"

  parameter {
    name  = "innodb_buffer_pool_size"
    value = "536870912"
  }
}

# AWS RDS Instance with configuration to allow MySQL compatibilty
resource "aws_db_instance" "tf_rds_instance" {
  identifier        = "tf-rds-instance"
  allocated_storage = 20
  engine            = "mysql"
  engine_version    = "5.7"
  instance_class    = "db.t2.micro"
  username          = "admin"    # change for setup based on user
  password          = "password" # change for setup 
  multi_az          = true       # Enable Multi-AZ deployment for high availability
  # monitoring_interval = 10  # Monitoring interval in seconds
  # monitoring_role_arn = "arn:aws:iam::123456789012:role/YourMonitoringRole"
  tags = {
    Name        = "kieran-rds-instance"
    Environment = "development"
    Labels      = "terraform_test"
  }
  parameter_group_name    = aws_db_parameter_group.tf_db_parameter_group.name
  backup_retention_period = 7 # Retain backups for 7 days
  # preferred_maintenance_window = "sun:04:00-sun:04:30"  # Adjust based on your maintenance window
  enabled_cloudwatch_logs_exports = ["audit", "error", "general", "slowquery"]

  # Subnet group for RDS instance
  db_subnet_group_name = aws_db_subnet_group.tf_db_subnet_group.name

  # Security group for RDS instance
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  skip_final_snapshot = true
}

# output "ec2_instance_public_ip" {
#   value = aws_instance.my_instance.public_ip
# }



