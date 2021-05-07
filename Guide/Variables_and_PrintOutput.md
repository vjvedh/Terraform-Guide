# Variables

##### - To create a User Defined Variable: 
```
variable "myVar1" {
	type = string
	default = "Terraform is best."
}
```
Syntax Info:
- variable "Variable Name" {
	type = DataType
	default = "Default Value of Variable"
	} 

# Output
##### - To print a string.

```
output "myOutputValue"{
    value = "Hello World"
}
```

##### - To print the value from a variable.
```
output "myOutputValue"{
	value = "${var.myVar1}"
}
```
Syntax Info:
- output " Output Name" {
	value = "\${var.VariableName}"
	} 
	"\${var.VariableName}" -> Inside the string ${} helps to make a reference to variables and var. tells that this is a user defined variable type.
	
# Steps: 
1. Create a file with .tf extension and add the above syntax in it to create a variable and print it.
2. Run the terraform code.
	```
	terraform apply
	```
