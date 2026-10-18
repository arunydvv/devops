variable "ec2_instane_type" {
    default = "t2.micro"
    type = string
}

variable "ec2_root_storage_size" {
    default = 15
    type = number
}

variable "ec2_ami_id" {
    default = "ami-06259b63260eddc13"
    type = string
}