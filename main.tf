# --- 2. Create the EBS Volume ---

resource "aws_ebs_volume" "data_volume" {
  # The volume MUST be created in the same Availability Zone (AZ) as the EC2 instance.
  availability_zone = var.az_name
  
  # Volume type (gp3 is the modern, general-purpose standard)
  type              = "gp3"
  
  # Size in GiB
  size              = 50 
  
  # Optional: Enable encryption (best practice)
  encrypted         = true

  tags = {
    Name = "Terraform-Data-Volume"
  }
}

# --- 3. Attach the Volume to the EC2 Instance ---

resource "aws_volume_attachment" "ebs_att" {
  # Reference the ID of the volume created above
  volume_id   = aws_ebs_volume.data_volume.id
  
  # Reference the ID of the existing EC2 instance
  instance_id = var.instance_id
  
  # The device name seen by the operating system. 
  # This typically maps to /dev/xvdf, /dev/xvdg, etc., on Linux.
  device_name = "/dev/sdf"
}

# --- 4. Output the Volume ID (for reference) ---

output "ebs_volume_id" {
  description = "The ID of the newly created EBS volume."
  value       = aws_ebs_volume.data_volume.id
}
