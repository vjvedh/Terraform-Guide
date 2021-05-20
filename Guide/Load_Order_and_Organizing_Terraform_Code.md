# Organizing Terraform Code

To organize a big Terraform Code, we split the code in different `.tf` or `.tf.json` extension terraform codes.
Terraform will load the code in lexical order i.e., it will check and load it according to alphabetical order.
But as terraform is smart or we can say Declarative, it knows which file to run first and it plan according to it. This concept is known as inference.

To order resources add: 

```depends_on = [
  ResouceType.ResouceUniqueTag
]
```

Example: 
There are two files *Resource1.tf* and *Resource2.tf*. And Resource2 needs to be executed after Resource1.

Resource1.tf
```
resource "resourceType1" "ResourceTag1" {
}
```

Resource2.tf
```
resource "resourceType2" "ResourceTag2" {
	depends_on = [
		resouceType1.ResouceTag1
	]	
}
```