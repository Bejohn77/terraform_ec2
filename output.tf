output "ec2_public_dns" {
  value = values(aws_instance.my_instance)[*].public_dns
}

output "ec2_public_ip" {
  value = values(aws_instance.my_instance)[*].public_ip
}

