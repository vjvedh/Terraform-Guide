resource "aws_volume_attachment" "attachedEBS"{
  device_name = "/dev/sdc"
  volume_id = aws_ebs_volume.NewEBS_Volume.id
  instance_id = aws_instance.WebServer.id
}