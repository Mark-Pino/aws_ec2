provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key_id
  secret_key = var.aws_secret_access_key
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg_ssh"
  description = "Permitir acceso SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # pruebas
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SecurityGroupSSH"
  }
}

resource "aws_instance" "mi_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = var.ec2_name
  }
}

# IP pública
output "ec2_public_ip" {
  value = aws_instance.mi_ec2.public_ip
}

# output "ec2_instance_id" {
#   value = aws_instance.mi_ec2.id
# }

# output "ec2_public_dns" {
#   value = aws_instance.mi_ec2.public_dns
# }