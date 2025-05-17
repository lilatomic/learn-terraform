---
title: 'Referencing resources'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How do I use values from one resource in another?
- How do I reference a resource outside of my code?
- How do I store a common piece of data?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Demonstrate referencing resources
- Demonstrate `data` for referencing external resources
- Demonstrate `locals` for common pieces of data

::::::::::::::::::::::::::::::::::::::::::::::::

## Referencing other resources in IAC

Often resources depend on properties of other resources.
For example, adding a role assignment depends on the ID of the principal, the ID of the target of the assignment, and the ID of the role. If the principal is defined in the same IAC as the assignment, its ID can be referenced directly by an identifier made of the resource type and the name, joined by a `.`. For example, `azurerm_resource_group.my_rg`.

```terraform
resource "azurerm_resource_group" "my_resource" {
  name     = "example"
  location = "West Europe"
}

resource "azuread_application" "my_application" {
  display_name = "example"
  owners       = []
}

resource "azurerm_role_assignment" "my_role_assignment" {
  scope                = azurerm_resource_group.my_resource.id
  role_definition_name = "Reader"
  principal_id         = azuread_application.my_application.object_id
}
```

Note also that we can reference the attributes of the object (for example, `object_id` of the `azuread_application.my_application`). The attributes often correspond to the inputs on the block, and they also include many other attributes only known after creation. For example, an `azurerm_storage_account` resource has a `primary_access_key` attribute which is created when the account is created.

## Referencing resources outside of IAC

We may also need to reference resources outside of IAC. They may exist in other IAC deployments, they may be controlled by other teams, or they may be things that exist globally. Because Terraform is not managing these resources but is only getting data from them, these are called `data` resources. These are defined similarly to resources in Terraform, but with `data` instead of `resource`. For example:

```terraform
data "azurerm_resource_group" "my_rg" {
  name = "existing"
}

resource "azurerm_role_assignment" "my_role_assignment" {
  scope                = data.azurerm_resource_group.my_resource.id
  role_definition_name = "Reader"
  principal_id         = azuread_application.my_application.object_id
}
```

Date resources can be referenced by other resources with an identifier formed of the litteral `data`, the resource type, and the name. For example, `data.azurerm_resource_group.my_rg`.

## Referencing common values

Terraform supports reusing values with the `locals` block. Values can be referenced by name using `local` (without an "s" at the end)

```terraform
locals {
  region = "West Europe"
}

resource "azurerm_resource_group" "my_resource" {
  name     = "example"
  location = local.region
}
```

## Dependencies though references

Every reference of another resource creates a dependency link between the referring resource and the referenced resource. This means that the referenced resource will be created before the referring resource. This is often desirable. For example, we need to create a resource group before we can put resources in it. This is a reason to use references to resources instead of a common value. For example, Azure resources often have a `resource_group_name` argument. If we typed the name of the resource group, Terraform wouldn't know that it needs to create the resource group first.

We can also manually create dependencies between resources. We use the [depends_on argument](https://developer.hashicorp.com/terraform/language/meta-arguments/depends_on), for example with:
```terraform
resource "azurerm_network_security_group" "allow_grafana" {
  # this allows us to contact Grafana through the network
}

resource "grafana_dashboard" "our_service" {
  # creating this dashboard requires a network connection to the Grafana server
  depends_on = [
    azurerm_network_security_group.allow_grafana
  ]
}
```



::::::::::::::::::::::::::::::::::::: keypoints 

- Terraform resources can reference other resources with an identifier formed by their type and name
- Terraform can reference resources outside of IAC with `data` resources
- `locals` can be used to reference values
- `depends_on` can be used to create links between resources

::::::::::::::::::::::::::::::::::::::::::::::::

