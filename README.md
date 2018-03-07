# geomar-vpc-demo
Geomar VPC - Demo

Automating Infrastructure deployment

## Requirements:

* AWS Account
* Workstation with AWS CLI deployed
* Workstation with Terraform deployed
* Workstation with Ansible deployed

## Usage

Set the following environment variables
* ANSIBLE_HOST_KEY_CHECKING=False
* AWS_ACCESS_KEY_ID=<id>
* AWS_DEFAULT_REGION=<region>
* AWS_SECRET_ACCESS_KEY=<key>
* TF_VAR_aws_ingressIP=<lockdown IP / null>
* TF_VAR_vpc_id=<vpc>
