resource "null_resource" "OpenWebpageInLocalEnv" {

    depends_on = [
       null_resource.Formatting
    ]

    provisioner "local-exec" {
      command = "start chrome http://${aws_instance.WebServer.public_ip}/"
    }
}