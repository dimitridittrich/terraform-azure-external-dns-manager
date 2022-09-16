# Terraform Module - {{ provider_name }} - {{ module_name }}

Terraform module to create {{ module_name }}.

## Usage

```hcl
module "{{ module_ref }}" {
  source = "{{ git_repo_url }}/{{ provider_slug }}/{{ module_repo_name }}.git?ref=v0.0.0"

  name = "tf-example-{{ example_slug }}"
}
```

### Requirements

The following tools must be available in your `PATH` in order to run the above command:

- [terraform](https://www.terraform.io/downloads.html) >= 1.0.1
- Git >= 2.20.0

## Examples

- [{{ example_name }}](examples/{{ example_slug }}/)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Updating 

We create one script to help the team ?

## License

Copyright © {% now 'utc', '%Y' %}. All rights reserved.