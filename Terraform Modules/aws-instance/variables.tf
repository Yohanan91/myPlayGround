variable "region" {
    description = "The region to deploy the VM"
    type        = string
    default     = null
}

variable "vm_count" {
    description = "Number of VMs to provision."
    type        = number
}

variable "use_latest_ami" {
    description = "value"
    type        = bool
    default = true
}

variable "os_family" {
    description = "value"
    type        = string
    default     = null
}

variable "ami_id" {
    description = "The AMI to use if latest is set to false"
    type        = string
    default     = null
}

variable "instance_type" {
    description = "value"
    type        = string
}

variable "key_name" {
    description = "Key Pair to use"
    type        = string
    default     = null
}

variable "security_groups" {
    description = "SG(s) to be assigned to VM"
    type        = list(string)
}

variable "subnets" {
    description = "Subnet(s) to be assigned to VM"
    type        = list(string)
}

variable "iam_instance_profile" {
    description = "value"
    type = string
    default = null
}

variable "elastic_ip" {
    description = "value"
    type = bool
    default = false
}

variable "region" {
    description = "value"
    type        = string
    default     = "us-east-1"
}

variable "userdata_override" {
    description = "Specify an alternative base64_encoded template for provisioning"
    type        = string
    default     = null
}

variable "extra_tags" {
    description = "value"
    type        = map(string)
    default     = {}
}

variable "secondary_ebs_volume" {
    description = "Configure secondary ebs volume"
    default     = {
        ebs_size = null
        ebs_azs  = []
        ebs_type = null
        ebs_iops = null
        ebs_name = null
    }
}

variable "ebs_optimized" {
    description = "value"
    type = bool
    default = null
}

variable "source_dest_check" {
    description = "value"
    type        = bool
    default     = true
}
