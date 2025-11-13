#key pair

resource "aws_key_pair" "deployer" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")

}

#vpc and security group

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "my_security" {
  name        = "terra-sg"
  description = "this is our first terra code"
  vpc_id      = aws_default_vpc.default.id

  # inbound rules 

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"

  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }

  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "flask open"
  }
  # outbound rules
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

  }
}


#ec2 instance

resource "aws_instance" "my_instance" {
  for_each = tomap({
    tws1="t3.micro"
    tws2="t3.micro"
  }
  )
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.my_security.name]
  instance_type   = each.value
  ami             = var.ami_id #ubuntu

  root_block_device {
    volume_size = var.root_storage_size
    volume_type = "gp3"
  }

  tags = {
    Name = each.key

  }

}
