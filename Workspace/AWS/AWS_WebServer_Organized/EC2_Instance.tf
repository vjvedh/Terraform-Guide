resource "aws_instance" "WebServer"{
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = "t2.micro"
  security_groups = [ "${aws_security_group.allow_webserver.name}" ]
  key_name = "KEY_NAME"
  tags = {
    Name = "MyWebServer"
  }
}