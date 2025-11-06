# public ip of my ec2 vm
output "my-ec2-ip" {
  #value = aws_instance.example.public_ip
  value = aws_instance.example[*].public_ip
}

# ec2 machine instance id
output "my-ec2-ID" {
  value = aws_instance.example[*].id
}
