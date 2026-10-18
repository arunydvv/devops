# Sample Terraform AWS EC2 project

## Files
- `terraform.tf`: Terraform/provider version requirements and input variables.
- `providers.tf`: AWS provider configuration.
- `ec2.tf`: Finds an Ubuntu 22.04 AMI and creates one EC2 instance; outputs its ID and public IP.

## Prerequisites
- Terraform installed.
- AWS CLI installed and configured, for example with `aws configure`, or another supported AWS credential method.
- AWS permissions to describe AMIs and create/read/delete EC2 instances.

## Run
```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Review the plan before applying. To remove the resources created by this sample:
```bash
terraform destroy
```

## Customize
Change `aws_region`, `instance_type`, or `project_name` defaults in `terraform.tf`, or pass values using `-var`, for example:
```bash
terraform plan -var="aws_region=ap-south-1" -var="instance_type=t3.micro"
```

This sample does not configure a security group that allows inbound SSH/HTTP/HTTPS. It is intentionally not exposed for inbound access. EC2 usage may incur charges; check your account's current pricing and free-tier eligibility.
