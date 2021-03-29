provider "aws" {
    region = "us-west-2"
    shared_credentials_file = "~/.aws/credentials"
}

resource "aws_security_group" "allow_all" {
    name        = "allow_all"
    description = "Allow all inbound/outbound traffic"

    ingress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_all_traffic"
    }
}

resource "aws_instance" "kube-master" {
    ami = "ami-0ca5c3bd5a268e7db"
    instance_type = "t3.large"
    key_name = "ahalsey"
    security_groups = ["allow_all"]
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 20
    }
    tags = {
        Name = "k8s-master"
    }
}

resource "aws_instance" "kube-node-0" {
    ami = "ami-0ca5c3bd5a268e7db"
    instance_type = "t3.large"
    key_name = "ahalsey"
    security_groups = ["allow_all"]
    ebs_block_device {
        device_name = "/dev/sda1"
        volume_size = 20
    }
    tags = {
        Name = "k8s-worker-0"
    }
}