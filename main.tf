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
  
  size              = 10
  type              = "gp3"
  encrypted         = true

  tags = {
    Name = "${aws_instance.web.tags.Name}-Data-Disk"
  }
}

resource "aws_volume_attachment" "web_data_disk_att" {
  volume_id   = aws_ebs_volume.web_data_disk.id
  instance_id = aws_instance.web.id
  device_name = "/dev/sdf" 
}
