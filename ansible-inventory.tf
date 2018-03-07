resource "null_resource" "ansible-inventory" {
    depends_on = ["aws_instance.JenkinsServer"]

    provisioner "local-exec" {
        command = "echo > ansible-inventory"
    }

    provisioner "local-exec" {
        command = "echo [servers] >> ansible-inventory"
    }

    provisioner "local-exec" {
        command = "echo \"${format("%s ansible_user=%s", aws_instance.JenkinsServer.0.public_ip, var.ssh_user)}\" >> ansible-inventory"
    }

    provisioner "local-exec" {
        command = "echo >> ansible-inventory"
    }
}
