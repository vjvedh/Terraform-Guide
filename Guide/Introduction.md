# Hashicorp Terraform

It is a **[Infrastructure as Code](Infrastructure_as_Code.md)** *(IaC)* tool used for provisioning the OS/Data Center.

## Features:
- Consistent and Predictable: Every time the code is deployed the resulted environment will always be same.
- Code can be written in YAML, JSON, or HCL(HashiCorp Configuration Language) format.
- Idempotent: If the part of configuration exists it will not run that part.
- Declarative: Just need to mention what to do and it will do it rather than mentioning how to do.

### Providers:
- Providers are those who provide resources.
- Examples of some providers are: AWS, GCP, Azure.

### Resources:
- Resources are the services which are provided by the providers.
- Examples of some resources are: EC2(AWS), EBS(AWS), Load Balancer.

### Data Source
- Every resource has its Data Source. Data Source is basically the detail of list of keys used in the resource.
- Data Source helps in knowing what argument to use. Eg: public_key in Resource "aws_instance"

**To check the Terraform version.**
```
terraform version
```

**To initialize the Terraform code.**
```
terraform init
```

**To validate the Terraform code syntax.**
```
terraform validate
```

**To check and verify the code plan.**
```
terraform plan
```

**To run the Terraform code.**
```
terraform apply
```

**To destroy the everything created using Terraform code.**
```
terraform destroy
```

1. ## [Variables and Output](Variables_and_PrintOutput.md) in Terraform.
2. ## [Terraform State](Terraform_State.md)
3. ## [Connection](Connection.md) in Terraform.
4. ## [Provisioners](Provisioners.md) in Terraform.
5. ## [Null-Resource](Null_Resource.md) in Terraform.
6. ## [Load Order and Organizing Terraform Code](Load_Order_and_Organizing_Terraform_Code.md)