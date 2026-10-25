# 🏢 Production Infrastructure Deployment with Terraform Data Blocks

[![Azure](https://img.shields.io/badge/Azure-Production_Infra-0078D4?style=for-the-badge&logo=microsoftazure&logoColor=white)](https://azure.microsoft.com/)
[![Terraform](https://img.shields.io/badge/Terraform-Data_Blocks-844FBA?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Security](https://img.shields.io/badge/Security-KeyVault%20%7C%20RBAC-yellow?style=for-the-badge)](https://azure.microsoft.com/)

---

## 📌 Overview

This repository demonstrates **production-grade Azure infrastructure provisioning** leveraging Terraform **Data Sources (data blocks)** to safely reference existing enterprise resources (Virtual Networks, Subnets, Key Vaults) without tightly coupling state or risking accidental modification of upstream foundational infrastructure.

### Key Highlights
* 🔍 **Data Sources Architecture**: Dynamic discovery of existing subnets, resource groups, and network security groups.
* 🔐 **Azure Key Vault Secrets Injection**: Secure retrieval of admin credentials and SSH public keys during VM provisioning.
* 🛡️ **Zero Hardcoded Secrets**: Fully decoupled variable structure with encrypted state management.
* 💻 **Compute & Network Resources**: Provisions Network Interfaces (NICs), Public IPs, and Production Virtual Machines.

---

## 👨‍💻 Author

**Md Irshad Alam**  
*Senior Azure DevOps Engineer & Multi-Cloud Platform Architect*  
* 💼 **LinkedIn:** [linkedin.com/in/md-irshad-alam-0a5278220](https://www.linkedin.com/in/md-irshad-alam-0a5278220)  
* 📬 **Email:** `mdirshadalam91190@gmail.com`  
