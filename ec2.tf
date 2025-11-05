# creating ec2
resource "aws_instance" "example" {
 #ami           = "ami-0a25a306450a2cba3"
  ami = var.sdas-ami-id
  instance_type = var.vm-size-sd
  key_name      = var.ec2-key-name
  # changing tags_all to tags
  tags = {
    "Name" = var.vm-name
  }
}
resource "local_file" "ip_file" {
    content  = aws_instance.example.public_ip
    filename = "ec2_public_ip.txt"
    #making manual dependency
    depends_on = [ aws_instance.example ]
}