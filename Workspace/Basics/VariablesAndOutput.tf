variable "myVar1" {
    type = string
    default = "Terraform is best."
}

output "myOutputValue"{
    value = "Hello World"
}

output "myOutputValueFromVariable"{
    value = "${var.myVar1}"
}