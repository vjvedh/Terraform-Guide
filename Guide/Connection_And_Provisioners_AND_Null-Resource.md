# Connection:
- Connection blocks don't take a block label, and can be nested within either a `resource` or a `provisioner`.
- The function of a **Connection** block is to set up a remote connection to an instance or OS using `ssh` or `winrm`.

Syntax of Connection block nested in a resource block:
```
resource "" "" {
	
	connection {
		type     = "ssh"
		user     = "root"
		password = "${var.root_password}"
		host     = "${var.host}"
  	}
}
```
 Syntax Info:
 - type: Connection method: ssh or winrm.
 - user: Username to connect to.
 - password: Password of the user.
	or
	private_key: Location of Private Key. Use: file("LocationOFKey") function to enter key location.
 - host: IP of the OS to connect.
	
	
# Provisioner:
Provisioners can be used to model specific actions on the local machine or on a remote machine in order to prepare servers or other infrastructure objects for service.
In lay man's term, Provisioner will help in running commands or script inside a OS or Instance.
- Types of Provisioners:
	- `local-exec` : It will help in executing commands and scripts inside the local environment.
	- `remote-exec` : It will help in executing commands and scripts in remote environment. 
- In case of `remote-exec` provisioner will need a connection block to connecting with the remote instance.
- Provisioners must be nested in a resource block.
- Multiple Provisioners can be added in a resource block.

Syntax of Provisioner block:

1.	`local-exec` Block Syntax:
```
resource "" "" {
    
	provisioner "local-exec" {
    	command    = "echo 'Running command in local environment'"
  	}
}
```

-	Syntax Info:
	-	command: Command string to get executed.

2.	`remote-exec` Block Syntax:
	
	Connection Block outside `remote-exec` provisioner block:
```
	resource "" "" {

		connection {
			type     = "ssh"
			user     = "root"
			password = "${var.root_password}"
			host     = "${var.host}"
		}

		provisioner "remote-exec" {
			inline = [
				"echo 'Hi'",
				"echo 'Bye'"
			]

		}
	}
```

OR
Connection block inside provisioner block:	

```
resource "" "" {
	
	provisioner "remote-exec" {
		
		connection {
			type     = "ssh"
			user     = "root"
			password = "${var.root_password}"
			host     = "${var.host}"
  		}
		
		inline = [
      		"echo 'Hi'",
			"echo 'Bye'"
		]

  	}
}
```
-	Syntax Info:
	-	inline: List of commands executed in order.


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