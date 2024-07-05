output "subnet_ids" {
  value = aws_subnet.new_subnets[*].id
}