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
