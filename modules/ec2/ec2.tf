# creating ec2
resource "aws_instance" "example" {
 #ami           = "ami-0a25a306450a2cba3"
  count = var.number_of_vm
  ami = var.sdas-ami-id
  instance_type = var.vm-size-sd
  key_name      = aws_key_pair.ec2_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  #security_groups = [aws_security_group.allow_tls.name]
  # changing tags_all to tags
  tags = {
    "Name" = "${var.vm-name}-${count.index}"
  }

  #provisioner
provisioner "remote-exec" {
inline = [
  "sudo dnf install git httpd -y",
  "mkdir -p hello/terraform"  
 ]

}

connection {
type = "ssh"
user = "ec2-user"
host = self.public_ip
#content of private key data
private_key = tls_private_key.rsa-4096-example.private_key_pem

}
  
}
resource "local_file" "ip_file" {
    content  = join("\n",aws_instance.example[*].public_ip)
    filename = "ec2_public_ip.txt"
    #making manual dependency
    depends_on = [ aws_instance.example ]
}




