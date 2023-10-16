resource "tls_private_key" "ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "dockey"
  public_key = tls_private_key.ssh-key.public_key_openssh

  provisioner "local-exec" {
    command = <<-EOT
         echo '${tls_private_key.ssh-key.private_key_pem}' >> ../private_key/dockey.pem
         chmod 400 dockey.pem
      EOT
  }
}
resource "local_file" "local_key_pair" {
  filename        = ("private_key/dockey.pem")
  file_permission = "0600"
  content         = tls_private_key.ssh-key.private_key_pem
}