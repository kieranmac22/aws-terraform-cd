# AWS EC2 Configuration

resource "aws_instance" "tf_instance" {
  ami           = "ami-xxxxxxxxxxxxxxxxx" # Amazon Linux 2 AMI ID
  instance_type = "t2.micro" # small instance type setup to testing purposes
  subnet_id     = aws_subnet.subnet_a.id
  count         = var.instance_count

  tags = {
    Name = "kieran-instance-${count.index + 1}"
    Labels      = "terraform_test"
  }
}

resource "aws_instance" "tagged_instance" {
  count = var.instance_count
  ami                    = "ami-xxxxxxxxxxxxxxxxx" # Amazon Linux 2 AMI ID
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.subnet_a.id
  key_name               = "" # Update with your key pair if needed
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  tags = {
    Name = "kieran-instance-${count.index + 1}"
    Labels      = "terraform_test"
  }
}