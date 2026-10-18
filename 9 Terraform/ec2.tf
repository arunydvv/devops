# # Find the latest Ubuntu 22.04 LTS AMI published by Canonical in this region.
# data "aws_ami" "ubuntu" {
#   most_recent = true
#   owners      = ["099720109477"]

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   filter {
#     name   = "root-device-type"
#     values = ["ebs"]
#   }
# }

# resource "aws_instance" "web" {
#   ami           = data.aws_ami.ubuntu.id
#   instance_type = var.instance_type

#   # No inbound SSH or web access is opened by this sample.
#   tags = {
#     Name        = var.project_name
#     Environment = "dev"
#   }
# }

# output "instance_id" {
#   description = "ID of the created EC2 instance"
#   value       = aws_instance.web.id
# }

# output "public_ip" {
#   description = "Public IPv4 address, if AWS assigns one"
#   value       = aws_instance.web.public_ip
# }




# ------------------------------------------------------------------------------------------------------------------
# Key pair (login)
# do ssh keygen

resource aws_key_pair my_key {
    key_name = "terra-key-ec2"
  # public_key = "paste_complete_key_here"
    public_key = file("terra-key-ec2.pub")   
}

# VPC & Security Group
resource "aws_default_vpc" "default" {
  # tags = {
  #   Name = "Default VPC"
  # }  
}

resource "aws_security_group" "my_security_group" {
  name = "automate-sg"
  description = "this will add a TF generatedSecurity group"
  vpc_id  = aws_default_vpc.default.id #interpolation

  # inbound rules (ingress)
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  #source
    description = "SSH open"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  #source
    description = "HTTP open"
  }

  ingress {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]  #source
    description = " Flask App"
  }



  # outbound rules (egress)
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]  #source
    description = "All ccess open outbound"
  }

}

# EC2 Instance
resource "aws_instance" "my_instance" {
  key_name = aws_key_pair.my_key
  security_groups = [aws_security_group.my_security_group.name]
  instance_type = var.ec2_instane_type
  ami = var.ec2_ami_id
  user_data = file("install_nginx.sh")

  root_block_device {
    volume_size = var.ec2_root_storage_size
    volume_type = "gp3"
  }
  tags = {
    Name = "name-of-instance"
  }
}



