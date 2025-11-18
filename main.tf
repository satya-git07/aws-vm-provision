resource "aws_instance" "web" {
  ami           = "ami-08b5b3a93ed654d19"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "web_data_disk" {
  # Get the AZ from the EC2 instance resource
  availability_zone = aws_instance.web.availability_zone 
  
  size              = 20 
  type              = "gp3"
  encrypted         = true

  tags = {
    Name = "${aws_instance.web.tags.Name}-Data-Disk"
  }
}
