# hello-aws
Learn about AWS-IaaS, CI/CD for SRE

## Dependency
- AWS
  - S3
  - EC2
  - ECS
  - Route53
  - and AWS-CLI
- Nginx
- CircleCI
- Terraform
- Docker
- Ansible
- Infrataster

## Prepare

### Credential for aws-cli

```
$ aws configure --profile hello-aws
AWS Access Key ID [None]: <your access key>
AWS Secret Access Key [None]: <your access secret >
Default region name [None]: ap-northeast-1
Default output format [None]: json
```

### Terraform

1. create .terraform.tfvars
2. terraform init
3. terraform plan
4. terraform apply (-auto-approve)
5. terraform destroy (-auto-approve)

## Login instance

```
$ ssh ec2-user@<ip addr>
```
