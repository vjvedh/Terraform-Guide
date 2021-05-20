resource "null_resource" "Formatting" {
    depends_on = [
       aws_volume_attachment.attachedEBS
    ]

    connection {
       type = "ssh"
       user = "ec2-user"
       private_key = file("Location//KEY_NAME.pem")
       host = aws_instance.WebServer.public_ip
    }

    provisioner "remote-exec" {
       inline = [
         "sudo mkfs.ext4 /dev/xvdc",
         "sudo mount /dev/xvdc /var/www/html"
       ]
    }
}