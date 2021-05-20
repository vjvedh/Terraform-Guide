# Terraform State

State is used to store the data about the infrastructure and configurations of the resources created.

There are two types of States:
- **Desired State**:
		It refers to the desired infrastructure data we mention during creating a terraform code.
- **Current State**:
		It is the current state fetch from the infrastructure created and is stored in a local file with `.tfstate` extension. It is created or refreshed after every time we used `terraform plan` or `terraform apply` command.
		
As terraform works on the concept of *idempotent*, it checks whether the desired state is same as current state, if so then it will not change anything or else if it is not same, then the current state will be changed with desired state.
