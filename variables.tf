# The variables used by our Terraform configuration are defined here.
# Their values are fetched from the ENV variables that we got set in the beginning. 

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "ami_id" {}
variable "key_name" {}
variable "region_id" {}
variable "ssh_username" {}

variable "vpc_security_group_ids" {
  type = "list"
}
