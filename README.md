# 🏢 Production Azure Infrastructure with Terraform Data Blocks

[![Azure](https://img.shields.io/badge/Microsoft%20Azure-Production_Infra-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/Terraform-Data%20Blocks-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Security](https://img.shields.io/badge/Security-Key%20Vault%20%7C%20RBAC-yellow?style=for-the-badge)](https://azure.microsoft.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)

---

## 📌 Executive Overview

This repository demonstrates **enterprise-grade production infrastructure provisioning** using Terraform **Data Sources (`data` blocks)** to safely decouple foundational networking from application compute workloads. 

By querying existing core resources (Resource Groups, Virtual Networks, Subnets, and Key Vault secrets) dynamically at runtime, teams avoid tight state coupling, eliminate blast radius risk, and strictly follow the **Principle of Least Privilege**.

---

## 🏛️ Production Architecture & Provisioning Flow

```mermaid
flowchart TD
    subgraph Core_Infra["🏢 Pre-Existing Core Infrastructure (Foundation)"]
        ExistingRG["Resource Group (rg-core-prod)"]
        ExistingVNet["Virtual Network (vnet-prod-hub-01)"]
        ExistingSubnet["Compute Subnet (snet-app-prod-01)"]
        ExistingKV["Azure Key Vault (kv-prod-sec-01)"]
        ExistingRG --- ExistingVNet
        ExistingVNet --- ExistingSubnet
    end

    subgraph Data_Discovery["🔍 Terraform Data Discovery Layer (Runtime Read-Only)"]
        DataRG["data 'azurerm_resource_group'"]
        DataSubnet["data 'azurerm_subnet'"]
        DataSecret["data 'azurerm_key_vault_secret' (Admin Credentials)"]
        
        ExistingRG -.->|Query Metadata| DataRG
        ExistingSubnet -.->|Query Subnet ID| DataSubnet
        ExistingKV -.->|Query Secure Secret| DataSecret
    end

    subgraph App_Workload["🚀 Production Workload Provisioning"]
        PIP["Public IP (Standard SKU, Static)"]
        NIC["Network Interface (Accelerated Networking)"]
        VM["Azure Linux/Windows Production VM"]
        Storage["Diagnostic Storage Account"]

        DataRG --> PIP
        DataRG --> NIC
        DataSubnet --> NIC
        PIP --> NIC
        NIC --> VM
        DataSecret -->|Inject Password / SSH Key| VM
        Storage -.->|Boot Diagnostics| VM
    end

    classDef core fill:#0078D4,stroke:#002050,stroke-width:2px,color:#fff;
    classDef data fill:#844FBA,stroke:#3D1166,stroke-width:2px,color:#fff;
    classDef compute fill:#107C41,stroke:#043918,stroke-width:2px,color:#fff;
    class ExistingRG,ExistingVNet,ExistingSubnet,ExistingKV core;
    class DataRG,DataSubnet,DataSecret data;
    class PIP,NIC,VM,Storage compute;
```

---

### 🔍 Architectural Walkthrough & Component Explanation

1. **Foundational Decoupling (`Core Infrastructure`):**
   * Foundational infrastructure (Hub VNets, routing tables, corporate Key Vaults) is maintained in separate states to prevent accidental modification or teardown during application deployments.

2. **Dynamic Discovery (`Data Layer`):**
   * Terraform reads existing subnet IDs and resource attributes dynamically using `data "azurerm_subnet"`.
   * **Zero hardcoded resource IDs:** Configurations adapt seamlessly between regions and subscriptions.

3. **Zero Plaintext Secrets:**
   * Administrative passwords and SSH private keys are never stored in source code or `.tfvars`.
   * Terraform queries secrets securely from **Azure Key Vault** at execution time and injects them into the compute instance.

4. **Production Resiliency:**
   * Provisioned Network Interfaces (NICs) leverage **Accelerated Networking** for sub-millisecond network latency.
   * VMs are configured with standard static Public IPs, Network Security Group association, and managed boot diagnostics.

---

## 🚀 Deployment Guide

### 1. Prerequisites
* Azure CLI authenticated (`az login`) with active subscription.
* Existing Virtual Network and Subnet provisioned.
* Access to Azure Key Vault with `Key Vault Secrets User` role assigned to the executing Service Principal.

### 2. Execution
```bash
# Initialize Terraform
terraform init

# Validate configuration
terraform validate

# Plan against target environment
terraform plan -var-file="terraform.tfvars" -out=prod.tfplan

# Apply changes
terraform apply prod.tfplan
```

---

## 👨‍💻 Author

**Md Irshad Alam**  
*Senior Azure DevOps Engineer & Multi-Cloud Platform Architect*  
* 💼 **LinkedIn:** [linkedin.com/in/md-irshad-alam-0a5278220](https://www.linkedin.com/in/md-irshad-alam-0a5278220)  
* 📬 **Email:** `mdirshadalam91190@gmail.com`  
