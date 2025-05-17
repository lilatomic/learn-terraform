---
title: 'terraform-reuse'
teaching: 10
exercises: 2
---

:::::::::::::::::::::::::::::::::::::: questions 

- How can I reuse some Terraform code?
- How can I deploy the same Terraform but with different values?

::::::::::::::::::::::::::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::: objectives

- Introduce `module`s for reusing code
- Explain `variable` and `output` for passing data into and out of a module

::::::::::::::::::::::::::::::::::::::::::::::::


::::::::::::::::::::::::::::::::::::: keypoints 

- Terraform `module`s allow you to reuse code while specifying different values
- You can pass different values into a module with `variable`s
- You can get values out of a module with `output`s

::::::::::::::::::::::::::::::::::::::::::::::::

