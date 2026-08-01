# Terraform Azure Production Infrastructure

## Project Overview

This project provisions a production-ready Azure infrastructure using reusable Terraform modules. The infrastructure follows Infrastructure as Code (IaC) principles and is designed to be modular, scalable, and reusable across multiple environments.

## Architecture

The following Azure resources are deployed:

- Resource Group
- Virtual Network (VNet)
- Subnets
- Network Security Groups (NSG)
- Public IP Address
- Network Interface (NIC)
- Linux & Windows Virtual Machines

## Project Structure

```
terraform-azure-prod/
│
├── environments/
│   └── preprod/
│       ├── main.tf
│       ├── provider.tf
│       ├── variables.tf
│       ├── terraform.tfvars
│
├── modules/
│   ├── azurerm_resource-group/
│   ├── azurerm_virtual_network/
│   ├── azurerm_subnet/
│   ├── azurerm_public-ip/
│   └── azurerm_virtual-machine/
│
└── README.md
```

## Features

- Modular Terraform Architecture
- Reusable Terraform Modules
- Environment-based Deployment
- Infrastructure as Code (IaC)
- Production-ready Folder Structure
- Easy to Extend and Maintain

## Technologies Used

- Microsoft Azure
- Terraform
- AzureRM Provider
- Azure CLI
- Git
- GitHub

## Deployment Steps

### Initialize Terraform

```bash
terraform init
```

### Validate Configuration

```bash
terraform validate
```

### Generate Execution Plan

```bash
terraform plan
```

### Deploy Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

## Prerequisites

- Azure Subscription
- Azure CLI
- Terraform 1.x
- Git
- Visual Studio Code

## Future Enhancements

- Azure Load Balancer
- Azure Bastion
- NAT Gateway
- Azure Application Gateway
- Azure Key Vault
- Azure Monitor
- Log Analytics
- Azure Kubernetes Service (AKS)

## Author

**MD Irshad Alam**

Azure DevOps Engineer

Specialized in Azure Cloud, Terraform, CI/CD, Kubernetes, and DevSecOps.

---

⭐ If you found this project useful, consider giving it a Star.
