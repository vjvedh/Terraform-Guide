# Provisioning AWS EC2 and adding a EBS volume.

- **Provider**: *AWS* (aws)
	- Arguments:
		- Region: Region where you need to work on.
		- Profile: Profile Name with which you aws credentials are linked.

- **Resources**: 
	- *EC2 Instance* (aws_instance)   --> To Create a EC2 Instance
		- Arguments:
			- AMI Used = "ami-0a9d27a9f4f5c0efc"
			- Instance Type = t2.micro
	- *EBS Volume* (aws_ebs_volume)  --> To Create a EBS Volume
		- Arguments:
			- Availability Zone = Same as the EC2 Instance.
			- Size = Size of HD required in GB
	- *Attach EBS Volume* (aws_volume_attachment)  --> To Attach EBS Volume to a EC2 Instance
		- Arguments:
			- Device Name = Disk Name eg. "/dev/sdh"
			- Volume ID = IDVolume you need to attached
			- Instance ID = Where you need to attach the volume.

## Steps to create a AWS profile:
1. Install aws cli.
2. To create a profile with any ProfileName type the following in the terminal and fill your Access Key and Secret key.
	```
	aws configure --profile ProfileName
	```

## Steps to create a code for the above setup:
1. Create a file.
	```
	vim AWS_EC2_Instance_With_EBS_Volume.tf
	```
2. Code to create the instance and printing the details about the created instance:
	```
	provider "aws"{
	  region = "ap-south-1"
	  profile = "ProfileName"
	}
	
	resource "aws_instance" "MyRedhatOS"{
	  ami = "ami-0a9d27a9f4f5c0efc"
	  instance_type = "t2.micro"
	  tags = {
	    Name = "MyOS"
	  }
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
	
	resource "aws_volume_attachment" "attachedEBS"{
	  device_name = "/dev/sdh"
	  volume_id = aws_ebs_volume.NewEBS_Volume.id
	  instance_id = aws_instance.MyRedhatOS.id
	}
	``` 
	Syntax Info: 
	- Here we have provided access_key and secret_key using shared file credentials which is safer than the static credentials.
	
3. Initializing the Terraform Code. 
	```
	terraform init
	```
4. Checking and verifying the plan.
	```
	terraform plan
	```
	*EXECUTIONAL PLAN*:
		- Create a EC2 Instance
		- Create a EBS Volume
		- Attach Volume to Instance
5. Applying the plan.
	```
	terraform apply
	```