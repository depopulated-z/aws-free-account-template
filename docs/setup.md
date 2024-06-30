# How to create free aws server from scratch

## Apply account online

Proceed to [aws official website](https://aws.amazon.com/) and sign up for a new account. __Remember to set up alert for canceling after one year__.

## Create IAM user

1. Proceed to [IAM User Management](https://console.aws.amazon.com/iam/home?region=us-east-2#/users)
2. Add user `infra` with __Programmatic access__
3. Add user `infra` into `admin` group with `AdministratorAccess` policy

## Download / Create access key

You can directly download when you finished creating the user. Or, you can navigate to [infra user page](https://console.aws.amazon.com/iam/home?region=us-east-2#/users/infra?section=security_credentials) to create new access key.

Note: After this step, you should be able to have `AccessKeyId` and `SecretAccessKey` for infra user.

## Add the authentication info into credential file

Please take a look at `~/.aws/credentials`. If you do not have this file, you can create one and add the following

```text
[aws_free]
aws_access_key_id     = YOUR_INFRA_ACCESS_KEY
aws_secret_access_key = YOUR_INFRA_SECRET_KEY
```

## Write Terraform code

Please note that, when writing this documentation, the terraform version that is used is `0.12.23`.

### Link provider

Because we are going to use AWS as our cloud provider and we are going to launch resources on this cloud provider (e.g. EC2 for virtual machines, S3 for cloud storage, RDS for database service), we need to write something like this:

```terraform
# Configure the AWS Provider
provider "aws" {
  version                 = "~> 3.0"
  region                  = "ap-southeast-1"
  shared_credentials_file = "~/.aws/credentials" 
  profile                 = "aws_free"
}
```

Region here we select `ap-southeast-1` for setting up server in Singapore.

### Create EC2 resource

First of all, create a sub-folder called `modules/ec2`, which has `main.tf` and `variable.tf` inside. `main.tf` is used to initialize one (because we do not want to exceed the free tier) ec2 instance and `variable.tf` defines the variables that need to be passed into to create `aws_instance`.

```terraform
# variable.tf

variable ami_id {
  description = "ami id for the ec2 instance"
  type        = string
}

variable instance_type {
  description = "type of the instance, by default should be t2."
  type        = string
  default     = "t2.micro"
}
```

```terraform
# main.tf


```
