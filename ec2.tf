# creating ec2
resource "aws_instance" "example" {
  ami           = "ami-0a25a306450a2cba3"
  instance_type = "t2.nano"
  key_name      = "roche-key"
  # changing tags_all to tags
  tags = {
    "Name" = "sdas-vm"
  }
}
resource "local_file" "ip_file" {
    content  = aws_instance.example.public_ip
    filename = "ec2_public_ip.txt"
    #making manual dependency
    depends_on = [ aws_instance.example ]
}