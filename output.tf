output "vpn_id" {
  value = aws_vpc.jenkin_vpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "subnet_id" {
  value = aws_subnet.jenkin_subnet.id
}

output "security_group_ids" {
  value = aws_security_group.jenkin_sg.*.id
}

output "instance_id" {
  value = aws_instance.CICDInstance.*.id
}

output "public_ip" {
  value = aws_instance.CICDInstance.*.public_ip
}
