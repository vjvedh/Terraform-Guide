resource "null_resource" "PackageInstaller" {

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("Location/KEY_NAME.pem")
    host = aws_instance.WebServer.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo yum install php -y",
      "sudo systemctl start httpd",
      "sudo systemctl start httpd"
    ]
  }
}