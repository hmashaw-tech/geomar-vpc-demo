/**
 * Terraform Demo
 * By: Mark
 */

variable "ami_id" { default = "ami-f2d3638a" }

variable "aws_ingressIP" {}

variable "key_name" { default = "geomar-demo" }

variable "owner" { default = "Mark" }

variable "project" { default = "AWS-demo-mark" }

variable "subnet-public-a" { default = "subnet-68d82923" }

variable "vpc_id" {}
