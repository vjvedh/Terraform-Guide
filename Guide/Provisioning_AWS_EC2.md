# Provisioning AWS EC2 with Terraform

- **Provider**: *AWS* (aws)
	- Arguments:
		- Access Key: Username
		- Secret Key: Password
		- Region: Which region to work on.

- **Resource**: *EC2 Instance* (aws_instance)  --> To Create an EC2 Instance
	- Arguments: (Required) 
		- AMI Used = "ami-0a9d27a9f4f5c0efc"
		- Instance Type = t2.micro

*To know about all the arguments(required + optional) go to the terraform website and in the registry section choose the provider used and click the resource and get all the arguments list.*

## Steps to create a code for the above setup:
1. Create a file.
	```
	vim awsBasic.tf
	```
2. Code to create the instance and printing the details about the created instance.
	```
	provider "aws"{
	  region = "ap-south-1"
	  access_key = "Your Access Key"
	  secret_key = "Your Secret Key"
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
	``` 
	Syntax Info: 
	- provider "Provider Name"{arguments}
		- Here we have used static credentials i.e., we have provided access_key and secret_key within the code. It is not safe as everyone can view this.
	- resource "Resource Name" "Unique Resource Tag"{arguments}
	- output will print the details of created instance like IP, Availability zone etc. 
		- In value we are not using user defined variable rather we are using resource type variable, so it will be: ResourceName.ResourceTag i.e., aws_instance.MyRedhatOS. 
	
3. Initializing the Terraform setup. The following command will initialize the terraform and look for the file with ".tf" extension and download the required plugins for provider if not present.
	```
	terraform init
	```
4. Checking and verifying the plan(resources added and operations done) we are creating.
	```
	terraform plan
	```
	*EXECUTIONAL PLAN*:
		- Create a EC2 Instance
1. After verifying the plan we will apply it. Apply will check if provider is there i.e. initialize, check the plan i.e. plan and run it.
	```
	terraform apply
	```