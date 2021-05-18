# Provisioning Apache Web-Server in AWS.

- **Provider**: 
	- *AWS* (aws):
		- Arguments:
			- Region: Region where you need to work on.
			- Profile: Profile Name with which you aws credentials are linked.
	- Null

- **Resources**: 
	- *EC2 Instance* (aws_instance)   --> To Create a EC2 Instance
		- Arguments:
			- AMI Used = "ami-0a9d27a9f4f5c0efc"
			- Instance Type = t2.micro
			- Security_groups = Name of the security group adding.
			- Key_name  = Private Key that you need to create and save it for remote connection.
	- *Security Group* (aws_security_group)  --> To Create a Security Group
		- Arguments:
			- Name = Name of the Security group.
			- ingress = Ingress block containing incoming firewall rules.
			- egress = Egress block containing outgoing firewall rules.
	- *EBS Volume* (aws_ebs_volume)  --> To Create a EBS Volume
		- Arguments:
			- Availability Zone = Same as the EC2 Instance.
			- Size = Size of HD required in GB
	- *Attach EBS Volume* (aws_volume_attachment)  --> To Attach EBS Volume to a EC2 Instance
		- Arguments:
			- Device Name = Disk Name eg. "/dev/sdh"
			- Volume ID = IDVolume you need to attached
			- Instance ID = Where you need to attach the volume.
	- *Null-Resource* -> To connecting and running commands in Instance without affecting the infrastructure.

### Go through how to use [Provisioners, Connection and Null-Resource](Connection_And_Provisioners_AND_Null-Resource.md) in Terraform.

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
  
	resource "aws_security_group" "allow_webserver"{
		 name = "allow_httpd_server"
		 ingress {
			 from_port = 80
			 to_port = 80
			 protocol = "tcp"
			 cidr_blocks = ["0.0.0.0/0"]
		 }

		 ingress {

			 from_port = 22
			 to_port = 22
			 protocol = "tcp"
			 cidr_blocks = ["0.0.0.0/0"]
		 }

		 egress {
			 from_port = 0
			 to_port = 0
			 protocol = "-1"
			 cidr_blocks = ["0.0.0.0/0"]
		 }
	}

	resource "aws_ebs_volume" "NewEBS_Volume"{
		 availability_zone = aws_instance.WebServer.availability_zone
		 size = 10
		 tags = {
		 	Name = "NewEBS"
		 }
	}

	resource "aws_instance" "WebServer"{
		 ami = "ami-0a9d27a9f4f5c0efc"
		 instance_type = "t2.micro"
		 security_groups = [ "${aws_security_group.allow_webserver.name}" ]
		 key_name = "KEY_NAME"
		 tags = {
			Name = "MyWebServer"
		 }

	 	connection {
			 type = "ssh"
			 user = "ec2-user"
			 private_key = file("Location/KEY_NAME.pem")
	 		host = aws_instance.WebServer.public_ip
	 	}
		
		provisioner "remote-exec" {
			inline = [
				"sudo yum install httpd -y",
				"sudo yum install php -y",
				"sudo systemctl start httpd",
				"sudo systemctl start httpd"
			 ]
	 	}
	}

	resource "aws_volume_attachment" "attachedEBS"{
		 device_name = "/dev/sdc"
		 volume_id = aws_ebs_volume.NewEBS_Volume.id
		 instance_id = aws_instance.WebServer.id
	}

	resource "null_resource" "Formatting" {
		 connection {
			 type = "ssh"
			 user = "ec2-user"
			 private_key = file("Location/KEY_NAME.pem")
		 	 host = aws_instance.WebServer.public_ip
	 	}

		 provisioner "remote-exec" {
			 inline = [
				 "sudo mkfs.ext4 /dev/xvdc",
				 "sudo mount /dev/xvdc /var/www/html",
			 ]
		 }
	}

	resource "null_resource" "OpenWebpageInLocalEnv" {
		 provisioner "local-exec" {
			command = "start chrome http://${aws_instance.WebServer.public_ip}/"
	 	 }
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
5. Applying the plan without typing yes for verification.
	```
	terraform apply --auto-approve
	```