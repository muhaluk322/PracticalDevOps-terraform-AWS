variable "publicSubnetCIDR" {}

variable "subnet_id" {}

variable "vpc_security_group_ids" {}

variable "instance_type" {
  #default instance_type to deploy
  type    = string
  default = "t2.micro"
}
