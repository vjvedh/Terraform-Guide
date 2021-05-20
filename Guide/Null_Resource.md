# Null-Resource:
Null-Resource is used to do nothing to the infrastructure, that is it won't affect the infrastructure but is used to write provisioners in it so as to run commands.

Syntax for creating a null-resource:
```
resource "null_resource" "mynull1"{
	
	provisioner "remote-exec" {
		
		connection {
		}
		
		inline = [
      	]

  	}
}
```

Null-Resource comes from a different provider so we need to initialize the provider using `terraform init`.