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
