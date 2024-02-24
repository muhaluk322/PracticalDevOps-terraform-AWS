data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
    #amzn2-ami-kernel-5.10-hvm-2.0.20211201.0-x86_64-gp2
  }
}

resource "aws_instance" "my_Amazon_Linux" {

  count                  = length(var.publicSubnetCIDR)
  ami                    = data.aws_ami.latest_amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids.*.id

  user_data = file("./modules/ec2/install_apache.sh")


  #tags are using variables.tf file
  tags = {
    Name = "My Amazon Linux Server"
  }
}
