locals {

    latest_amis = {
        windows_2019 = data.aws_ami.latest_amazon_windows_2019.id 
        rhel8        = data.aws_ami.latest_rhel8.id 
        ubuntu20     = data.aws_ami.latest_ubuntu20.id 
        ubuntu18     = data.aws_ami.latest_ubuntu18.id
    }

    os_family = var.os_family != null ? lower(var.os_family) : "custom"
    
}