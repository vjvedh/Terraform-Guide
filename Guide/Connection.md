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
