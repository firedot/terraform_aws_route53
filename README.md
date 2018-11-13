# terraform_aws_route53
Sample terraform configuration for AWS route53


# What is this repository about

This repository create a zone in AWS Route53 and adds an ```A``` record to it. 

## Prerequisites: 

- You should have terraform installed
- You should export the following environmental variables
```
export TF_VAR_aws_access_key="<your_aws_access_key>"
export TF_VAR_aws_secret_key=<your_aws_secret_key>
export TF_VAR_region_id="<your_region_id>"
export TF_VAR_vpc_security_group_ids='["<your_security_group_id>","<your_security_group_id>"]'

```
## How to use this repository


- Clone this repo

```
git clone https://github.com/firedot/terraform_aws_route53.git
```

- Go to the repo directory

```
cd terraform_aws_route53
```

- Run the following command

```
terraform plan
```
By running this command you will run a terraform plan, which will provide you with information on what is going to happen once you decide to provision your infrastructure. 

- To provision your infrastructure configuration, run the following command 

```
terraform apply
```
