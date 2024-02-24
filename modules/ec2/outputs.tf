output "ec2_ami" {
  value = aws_instance.my_Amazon_Linux[0].ami
}

output "ec2_public_ip" {
  value = aws_instance.my_Amazon_Linux[0].public_ip
}

output "ec2_type" {
  value = aws_instance.my_Amazon_Linux[0].instance_type
}