# creating ec2
resource "aws_instance" "example" {
  ami           = "ami-0a25a306450a2cba3"
  instance_type = "t2.nano"
  key_name      = "roche-key"
  tags_all = {
    "Name" = "sdas-vm"
  }
}
resource "local_file" "ip_file" {
    content  = aws_instance.example.public_ip
    filename = "ec2_public_ip.txt"
}