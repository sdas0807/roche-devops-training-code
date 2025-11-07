# public ip of my ec2 vm
output "my-ec2-ip" {
  #value = aws_instance.example.public_ip
  value = aws_instance.example[*].public_ip
}

# ec2 machine instance id
output "my-ec2-ID" {
  value = aws_instance.example[*].id
}

resource "local_file" "ip_file" {
    content  = "[sdas-roche]\n${join("\n",aws_instance.example[*].public_ip)}"
    filename = "${path.module}/ansible-inventory.txt"
    #making manual dependency
    depends_on = [ aws_instance.example ]
}