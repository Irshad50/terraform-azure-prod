rgs = {
  rg1 = {
    name     = "rg-preprod"
    location = "eastus"
  }
}

vnets = {
  vnet1 = {
    name                = "preprod-vnet"
    location            = "eastus"
    resource_group_name = "rg-preprod"
    address_space       = ["10.0.0.0/16"]
  }
}

subnets = {
  subnet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "preprod-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "rg-preprod"
    virtual_network_name = "preprod-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}
pips = {

  pip1 = {
    name                = "frontend_pip"
    resource_group_name = "rg-preprod"
    location            = "eastus"
    allocation_method   = "Static"
  }
  pip2 = {
    name                = "backend_pip"
    resource_group_name = "rg-preprod"
    location            = "eastus"
    allocation_method   = "Static"
  }
}
vms = {
  vm1 = {
    name                 = "frontend-vm"
    location             = "eastus"
    resource_group_name  = "rg-preprod"
    size                 = "Standard_D2alds_v7"
    nic_name             = "frontend-nic"
    virtual_network_name = "preprod-vnet"
    public_ip_name       = "frontend_pip"
    subnet_name          = "frontend-subnet"
    adminuser            = "aqsairam"
    password             = "Aqsair@9150"
  }
  vm2 = {
    name                 = "backend-vm"
    location             = "eastus"
    resource_group_name  = "rg-preprod"
    size                 = "Standard_D2alds_v7"
    nic_name             = "backend-nic"
    virtual_network_name = "preprod-vnet"
    public_ip_name       = "backend_pip"
    subnet_name          = "backend-subnet"
    adminuser            = "aqsairam"
    password             = "Aqsair@9150"

  }
}