module "resource_group" {
    source = "../../modules/azurerm_resource_group"
    rgs = var.rgs
}
module "vnet" {
    depends_on = [module.resource_group]
    source     = "../../modules/azurerm_virtual_network"
    vnets = var.vnets
}
module "subnet" {
    depends_on = [module.vnet]
    source     = "../../modules/azurerm_subnet"
    subnets = var.subnets
}
module "public_ip" {
    depends_on  = [module.subnet]
    source      = "../../modules/azurerm_public_ip"
    pips = var.pips
}
module "vm" {
    depends_on  = [module.public_ip]
    source      = "../../modules/azurerm_vm"
    vms = var.vms
}