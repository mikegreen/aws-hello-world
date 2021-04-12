resource "aws_instance" "ec2-example" {
  instance_type = "t2.micro"
  ami           = "ami-09558250a3419e7d0"
  tags = {
    Name = "example ec2"
  }
  }
