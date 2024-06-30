# AWS server infra

This project writes the basic infrastructure of our AWS server.

## Basic components

- VPC (use default)
- Security Group
  - webserver
  - database
- EC2 (for webserver)
- RDS (for database)

## To use this

You need to add credentials (including `access_key` and `secret_key`) into some file and let `main.tf` refer to that file. Only in this way can terraform code create the infra for you.

### Install terraform

Please install via the commands below. Note that our current working terraform version is 0.12.23

```bash
# for MacOS
brew install terraform@0.12
```

### To review the plan

```bash
terraform plan
```

### To apply the plan

```bash
terraform apply
```
