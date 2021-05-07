# Hashicorp Terraform: 

It is a **[Infrastructure as Code](Guide/Infrastructure_as_Code.md)** *(IaC)* tool used for provisioning the OS/Data Center.

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

To check the Terraform version.
```
terraform version
```