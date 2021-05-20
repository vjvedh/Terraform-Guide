resource "aws_ebs_volume" "NewEBS_Volume"{
  availability_zone = aws_instance.WebServer.availability_zone
  size = 1
  tags = {
    Name = "NewEBS"
  }
}