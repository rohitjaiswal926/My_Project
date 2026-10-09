module "azurerm_resource_group" {
  source = "../../modules/01_azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  source     = "../../modules/02_azurerm_virtual_network"
  depends_on = [module.azurerm_resource_group]

  vnet = var.vnet
}

module "azurerm_subnet" {
  source     = "../../modules/03_azurerm_subnet"
  depends_on = [module.azurerm_virtual_network]

  subnet = var.subnet
}

module "nsg" {
  source     = "../../modules/04_azurerm_nsg_group"
  depends_on = [module.azurerm_resource_group]

  nsg = var.nsg
}

module "public_ip" {
  source     = "../../modules/05_azurerm_public_ip"
  depends_on = [module.azurerm_virtual_network]

  public_ip = var.public_ip
}

module "azurerm_network_interface" {
  source = "../../modules/05.5azurerm_network_interface_card"

  depends_on = [
    module.azurerm_subnet,
    module.public_ip
  ]

  nic = {
    for key, value in var.nic : key => merge(value, {
      subnet_id = module.azurerm_subnet.subnet_ids[
        value.subnet_id
      ]

      public_ip_id = module.public_ip.public_ip_ids[
        value.public_ip_id
      ]
    })
  }
}

module "virtual_machine" {
  source     = "../../modules/06_azurerm_vm"
  depends_on = [module.azurerm_network_interface]

  virtual_machine = {
    for key, value in var.virtual_machine : key => merge(value, {
      network_interface_ids = [
        module.azurerm_network_interface.nic_ids[
          value.nic_id
        ]
      ]
    })
  }
}