/**
 * Terraform Demo
 * By: Mark
 */

# Create Amazon Linux Instance
resource "aws_instance" "JenkinsServer" {
    ami = "ami-79873901"
    instance_type = "t2.micro"

    # User Data - CloudInit
    user_data = "${file("user-data-jenkins.txt")}"

    # VPC subnet
    subnet_id = "${var.subnet-public-a}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.default-sg.id}"]

    # SSH key
    key_name = "${var.key_name}"

    tags {
        Name = "JenkinsServer"
        Owner = "${var.owner}"
        Project = "${var.project}"
        Terraform = "true"
        Description = "Ubuntu Jenkins Server - Demo"
    }
}

/*
# Create an Elastic IP for this instance
resource "aws_eip" "vm-JenkinsServer-eip" {
    instance = "${aws_instance.JenkinsServer.id}"
    vpc = true

    tags {
        Name = "vm-JenkinsServer-eip"
        Owner = "${var.owner}"
        Project = "${var.project}"
        Terraform = "true"
        Description = "EIP - Ubuntu Jenkins Server - Demo"
    }
}
*/

