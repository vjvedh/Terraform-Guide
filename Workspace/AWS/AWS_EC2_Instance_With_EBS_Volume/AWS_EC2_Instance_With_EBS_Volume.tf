provider "aws" {
  region = "ap-south-1"
  profile = "TerraformUser"
}

resource "aws_instance" "MyRedhatOS"{
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  tags = {
    Name = "MyOS"
  }
}

output "Instance1_Details"{
    value = aws_instance.MyRedhatOS
}

output "Instance1_IP"{
    value = aws_instance.MyRedhatOS.public_ip
}

output "Instance1_AvailabilityZone"{
	  value = aws_instance.MyRedhatOS.availability_zone
}
	
resource "aws_ebs_volume" "NewEBS_Volume"{
  availability_zone = aws_instance.MyRedhatOS.availability_zone
  size = 10
  tags = {
    Name = "NewEBS"
  }
}

output "CreatedVolumeID"{
	  value = aws_ebs_volume.NewEBS_Volume.id
}

resource "aws_volume_attachment" "attachedEBS"{
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.NewEBS_Volume.id
  instance_id = aws_instance.MyRedhatOS.id
}