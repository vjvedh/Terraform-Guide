provider "aws"{
  region = "ap-south-1"
  profile = "ProfileName"
}

resource "aws_security_group" "allow_webserver"{
  name = "allow_httpd_server"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }    

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ebs_volume" "NewEBS_Volume"{
  availability_zone = aws_instance.WebServer.availability_zone
  size = 1
  tags = {
    Name = "NewEBS"
  }
}

resource "aws_instance" "WebServer"{
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  security_groups = [ "${aws_security_group.allow_webserver.name}" ]
  key_name = "KEY_NAME"
  tags = {
    Name = "MyWebServer"
  }

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

resource "aws_volume_attachment" "attachedEBS"{
  device_name = "/dev/sdc"
  volume_id = aws_ebs_volume.NewEBS_Volume.id
  instance_id = aws_instance.WebServer.id
}

resource "null_resource" "Formatting" {
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

resource "null_resource" "OpenWebpageInLocalEnv" {
    provisioner "local-exec" {
      command = "start chrome http://${aws_instance.WebServer.public_ip}/"
    }
}