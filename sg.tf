resource "aws_security_group" "web-sg" {
  name        = "allow http/https/ssh"
  description = "Allow http/https/ssh"
  # vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = ["4200", "443", "8084", "8500", "22"]
    content {
      description = "allow http/ssh"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   tags = {
    Name = "sv2"
  }
}
