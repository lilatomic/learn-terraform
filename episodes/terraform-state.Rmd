---
title: 'State'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How does Terraform know what resources it created?
- How does Terraform know that those resources were changed?
- How does Terraform only change what needs to be changed?


::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the concept of the Terraform state
- Understand change detection
- Understand reconciliation of resources with the IAC

::::::::::::::::::::::::::::::::::::::::::::::::

## Remembering what was deployed

When we ran `terraform apply`, Terraform created our resources. It recorded these resources in its "state". The state is stored in a file. In our case, this file is stored locally in the `.tfstate` file. This file can be opened with any editor. Have a look at it.

You can also inspect the state with Terraform subcommands. The `state list` subcommand will list all the objects Terraform knows about. The `state show` subcommand will show a specific resource.

::: challenge
!! TODO
:::
::: solution

:::

## Change detection

Terraform uses this state to know when things have changed from when Terraform last saw them.

::: explore

Delete the !!TODO resource and redeploy the terraform code. See how terraform lets you know that the resource was deleted.

:::

## Reconcilliation

Change detection is actually more useful for Terraform to know what doesn't need to change. If you have a large Terraform deployment, it saves a lot of time to only deploy the resources that have changed. The process of modifying the resources to return them to their desired state is often called "reconcilliation".


::::::::::::::::::::::::::::::::::::: keypoints 

- Terraform keeps a record of the resources it created in a state file
- Terraform uses the state to detect what has changed
- Terraform can be used to restore resources to the desired state in a process called "reconcilliation"

::::::::::::::::::::::::::::::::::::::::::::::::

