data "aws_ami" "latest_amazon_windows_2019" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["Windows_Server-2019-English-Full-Base-*"]
    }
}

data "aws_ami" "latest_rhel8" {
    most_recent = true
    owners = ["amazon"]
}

data "aws_ami" "latest_ubuntu18" {
    most_recent = true
    owners = ["amazon"]
}

data "aws_ami" "latest_ubuntu20" {
    most_recent = true
    owners = ["amazon"]
}

data "template_file" "user_data" {
    count    = var.vm_count
    template = file("${path.module}/bootstrap/${local.base_os}/user_data.tpl")
}