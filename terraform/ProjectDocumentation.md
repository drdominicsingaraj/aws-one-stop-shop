# Terraform

Terraform is an **infrastructure as code** tool that allows you to:

1. **Define Resources**: Create human-readable configuration files describing the resources you want to manage. These resources can span multiple cloud providers and services.

2. **Execution Plan**: Terraform generates an execution plan based on your configuration. It outlines the infrastructure changes it will make (create, update, or destroy) while respecting resource dependencies.

3. **Apply Changes**: Upon approval, Terraform applies proposed changes in the correct order. For example, if you modify a Virtual Private Cloud (VPC) and change the number of virtual machines, Terraform ensures the VPC is recreated before scaling the VMs.

Terraform is versatile, supporting various platforms and services through **providers**. These providers enable Terraform to interact with APIs from different cloud providers and services, such as AWS, Azure, and Google Cloud Platform. It's a powerful tool for managing infrastructure consistently and repeatably! 😊

``` HCL
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}
```