---
title: 'terraform-resources'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do I define a resource in Terraform

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Find a resource in Terraform by name and type
- Create a resource in Terraform

::::::::::::::::::::::::::::::::::::::::::::::::

## Terraform syntax

Terraform is written in a data format called HCL.
This language has significantly fewer features than common programming languages like Python or scripting languages like Bash.
You can read about the syntax of HCL in the [official documentation](https://developer.hashicorp.com/terraform/language/syntax/configuration) or in many other tutorials.

For our purposes, resources are defined in resource blocks, which follow this pattern:

:::hcl
resource "providerName_resourceType" "name" {
  argument = value
}
:::

1. They always begin with `resource`
2. They include the type of the resource. This is usually a combination of the name of the provider followed by the type of the resource. (This fact is convenient for narrowing autocomplete suggestions)
3. The are followed by the name of the resource. This this the name _to Terraform_. This name will be referenced in the state file and by other resources. 
4. arguments defining the resource go inside of the braces

::: challenge

Find the resource for the file "file0". 

:::
::: solution

We can search the Terraform documentation for the resource type that creates files. It is called [local_file](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file). We can then search our Terraform files for all resources of that type. Notice that the name of the resources does not match the name of the file (which is in the `filename` argument). Remember that the name of the resource should be significant within the Terraform code, which provides us an opportunity to call it something other than the name of the file that needs to appear on disk.

:::

## Creating a resource

We may want to find the documentation for the type of the Terraform resource we want to deploy. Although many editors will provide suggestions for the names and types of the arguments we will need to supply, we may want more information than they present.

For creating a resource, we need to follow the format of a resource above. The name of a Terraform resource needs to be unique for its type: That is, we can have a `local_file` called "foo" and a `null_resource` called "foo", but we could not have 2 `local_file`s both called "foo".

::: challenge

Write Terraform that will create a file on disk called "my_file.txt" with text "Hello World!".

:::
::: solution

```hcl
resource "local_file" "solution" {
  filename = "my_file.txt"
  content  = "Hello World!"
}
```
:::


::::::::::::::::::::::::::::::::::::: keypoints 

- All resources in Terraform follow the same pattern: they begin with `resource`, then the resource type, then a name, and then the properties of the resource
- resource names in Terraform must be unique for all resources of a specific type

::::::::::::::::::::::::::::::::::::::::::::::::
