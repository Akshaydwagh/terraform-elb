resource "aws_instance" "linux_vm2" {
    ami                         = "ami-0d4c3eabb9e72650a"
    availability_zone           = "eu-central-1a"
    ebs_optimized               = false
    instance_type               = "t2.micro"
    monitoring                  = false
    key_name                    = "${var.key}"
    subnet_id                   = "${var.aws_subnet2}"
    source_dest_check = false
    vpc_security_group_ids      = ["sg-963bbef3"]
    associate_public_ip_address = true
    user_data = "${file("user-data2.sh")}"
    root_block_device {
        volume_type           = "gp2"
        volume_size           = 8
        delete_on_termination = false
    }
    tags = {
        Name = "linux_vm2"
    }
}

