---
title: 'The CLI'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How I you deploy Terraform?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Understand the Terraform workflow
- Know that Terraform dependencies are needed
- Demonstrate using the `init`, `plan`, and `apply` commands.

::::::::::::::::::::::::::::::::::::::::::::::::

## Introduction

Terraform exists as code files. These will tell Terraform what resources to deploy.

### Dependencies

Terraform itself is a general-purpose tool. It doesn't include tools to work with infrastructure and service providers, such as Clouds. These tools are called "Providers". Terraform needs to download them so it can use them to deploy your infrastructure. This is done with the `init` subcommand:

```sh
terraform init
```

Once the providers are downloaded, you will only need to reinitialise Terraform to download new providers or versions of those providers.

::: challenge

Initialise Terraform in the `01` sample.

:::

::: solution

In the `01` directory, run `terraform init`. You will see it download several providers. The output will look something like the following:

!!TODO

:::


## Plan

Before Terraform deploys your infrastructure, it formulates a plan of what it will do. You can see this plan with `plan` subcommand. The plan is useful to review what changes Terraform will make. You should double-check that it isn't going to delete anything important.

::: challenge

See the plan that Terraform will deploy for the `01` sample

:::

::: solution


In the `01` directory, run `terraform plan`. 
It should look like the following:

!! TODO

::: error

If you see Terraform mention that it is missing providers, you will need to initialise Terraform. Remember that this needs to be done the first time you are working on a deployment and every time the versions of the providers changes.

!! TODO

:::
:::

## Deploy

If the plan looks good, you can actually deploy the Terraform code. You do this with the `apply` subcommand. Terraform will show you the plan and ask for your confirmation

::: challenge

Deploy the `01` sample deployment

:::
::: solution

In the `01` directory, run `terraform apply`. You should see it create the resources.

!! TODO: show checking the resources

:::

::::::::::::::::::::::::::::::::::::: keypoints 

- Terraform needs other tools to run. These tools are called "providers"
- Download providers with the `init` subcommand
- Providers need to be downloaded once when you start working on a deployment and every time you either add new providers or modify their versions
- Terraform will show you a plan of what it will deploy with the `plan` subcommand
- Terraform will deploy your infrastructure with the `apply` subcommand

::::::::::::::::::::::::::::::::::::::::::::::::
