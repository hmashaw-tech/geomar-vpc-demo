/**
 * Terraform Demo
 * By: Mark
 */

# Create Amazon Linux Instance
resource "aws_instance" "DemoServer" {
    ami = "${var.ami_id}"
    instance_type = "t2.micro"

    # User Data - CloudInit
    user_data = "${file("user-data-demo.txt")}"

    # VPC subnet
    subnet_id = "${var.subnet-public-a}"

    # Security Group
    vpc_security_group_ids = ["${aws_security_group.default-sg.id}"]

    # SSH key
    key_name = "${var.key_name}"

    tags {
        Name        = "DemoServer"
        Owner = "${var.owner}"
        Project     = "${var.project}"
        Terraform   = "true"
        Description = "Linux Host - Demo"
    }
}
