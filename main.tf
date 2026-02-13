resource "aws_security_group" "ec2_sg" {
  name = "terraform-sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ec2" {
  ami           = "ami-0f5ee92e2d63afc18"   # Amazon Linux 2 x86 (ap-south-1)
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-EC2"
  }
}


