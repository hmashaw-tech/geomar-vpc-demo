/**
 * Terraform Demo
 * By: Mark
 */

 # VPC Default Security Group
resource "aws_security_group" "default-sg" {
    vpc_id = "${var.vpc_id}"
    name = "default-sg"
    description = "geomar VPC Default Security Group"

    # Review the CIDR blocks below to see if they can be made to work with COUNT

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${var.aws_ingressIP}"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${var.aws_ingressIP}"]
    }

    tags {
        Name = "default-sg"
        Owner = "${var.owner}"
        Project   = "${var.project}"
        Terraform = "true"
    }
}
