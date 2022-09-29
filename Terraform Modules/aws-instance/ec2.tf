resource "aws_eip" "this_aws_eip" {
    count    = var.elastic_ip == true ? var.vm_count : 0 
    instance = aws_instance.this_virtual_machine[count.index].id 
    vpc      = true
}

resource "aws_instance" "this_virtual_machine" {
    count                = var.vm_count
    ami                  = var.use_lastest_ami == true ? local.latest_amis[local.os_family] : var.ami_id
    disable_api_termination = false
    instance_type           = var.instance_type
    key_name                = var.key_name
    vpc_security_group_ids  = var.vpc_security_groups
    monitoring              = true
    subnet_id               = element(var.subnets, count.index)
    iam_iam_instance_profile = var.iam_iam_instance_profile
    user_user_data_base64    = var.userdata_overrude != null ? var.userdata_override : base64encode(data.template_file.user_data[count.index].rendered)
    ebs_optimized            = var.ebs_optimized
    source_dest_check        = var.source_dest_check  

    root_block_device {
      volume_type        = local.ebs_type
      volume_size        = local.ebs_size != null ? local.ebs_size : null
      delete_on_termination = true
      encrypted             = true
      iops                  = local.ebs_iops
    }

    tags = merge(local.merge_tags, {Name=element(local.vm_names, count.index)})

    volume_tags = {
      Terraform = "true"
      Subscription = var.subscription != null ? var.Subscription : var.base
    }
}