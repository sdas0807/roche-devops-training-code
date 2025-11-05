# RSA key of size 4096 bits
resource "tls_private_key" "rsa-4096-example" {
    algorithm = var.key_algo
    rsa_bits = var.key_size  
}

resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "sd-ec2-key-4096"
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.rsa-4096-example.private_key_pem
  filename = "${path.module}/sd-ec2-key-4096.pem"
  file_permission = 0400
}