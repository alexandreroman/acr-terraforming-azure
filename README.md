# Terraforming an Azure Container Registry (ACR) instance

Using this project, you can provision an ACR instance with Terraform.

## How to use it?

Make sure you are authenticated with your Azure tenant,
[using the Azure CLI](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli).

Terraform will create resources in an existing Azure resource group.
If you need to create a new resource group, use this command:

```shell
az group create -l francecentral -n myacr
```

Create a configuration file `terraform.tfvars`
starting from [terraform.tfvars.template](terraform.tfvars.template):

```tfvars
az_res_group = "myacr"
az_acr_name  = "myacr"
```

Initialize Terraform resources:

```shell
terraform init
```

You are now ready to use Terraform to provision your ACR instance:

```shell
terraform apply
```

A few seconds later, your ACR instance should be ready.

Get everything you need to connect to your ACR instance:

```shell
export ACR_HOSTNAME=$(terraform output --raw acr_hostname)
export ACR_USERNAME=$(terraform output --raw acr_username)
export ACR_PASSWORD=$(terraform output --raw acr_password)
```

You can now connect to your ACR instance using this command:

```shell
echo "$ACR_PASSWORD" | docker login -u $ACR_USERNAME --password-stdin $ACR_HOSTNAME
```

Use this command to destroy the ACR instance (everything will be destroyed!):

```shell
terraform destroy
```

Hope it helps!

## Contribute

Contributions are always welcome!

Feel free to open issues & send PR.

## License

Copyright &copy; 2023 [VMware, Inc. or its affiliates](https://vmware.com).

This project is licensed under the [Apache Software License version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
