# Provisioning AWS EC2 with Terraform.

- Provider: AWS
		- Access Key: Username
		- Secret Key: Password
		- Region: Which region to work on.

- Resources: 
		- EC2 Instance.
				- AMI Used = "ami-0a9d27a9f4f5c0efc"
				- Instance Type = t2.micro

## Steps to create a code for the above setup:
1. Create a file.
	```
	vim awsBasic.tf
	```
2. Code:
	```
	provider "aws"{
	  region = "ap-south-1"
	  access_key = "Your Access Key"
	  secret_key = "Your Secret Key"
	}
	
	resource "aws_instance" "MyRedhtOS"{
	  ami = "ami-0a9d27a9f4f5c0efc"
	  instance_type = "t2.micro"
	  tags = {
	    Name = "MyOS"
	  }
	}
	``` 
	Syntax Info: 
	provider "Provider Name"{}
	resource "Resource Name" "Unique Resource Tag"{}
	
3. Initializing the Terraform. The following command will initialize the terraform and look for the file with ".tf" extension and download the required plugins for provider if not present.
	```
	terraform init
	```
4. Checking and verifying the plan(resources added and operations done) we are creating.
	```
	terraform plan
	```
5. After verifying the plan we will apply it. Apply will check if provider is there i.e. initialize, check the plan i.e. plan and run it.
	```
	terraform apply
	```