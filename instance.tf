resource "aws_instance" "web" {
  ami                         = "ami-0287a05f0ef0e9d9a" #Ubuntu 20.04 LTS Free Tier Image
  instance_type               = "t2.micro"
  key_name                    = "goku"
  subnet_id                   = aws_subnet.public_subnet.id
  vpc_security_group_ids      = [aws_security_group.allow_http_ssh.id]
  user_data                   = file("nginx-install.sh")
  availability_zone           = "ap-south-1"
  associate_public_ip_address = true

  tags = {
    "Name" = "WebApp-terraform"
  }
}
