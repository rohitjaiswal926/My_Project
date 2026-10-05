resource "azurerm_linux_virtual_machine" "virtual" {
  for_each = var.virtual_machine

  name                  = each.value.name
  resource_group_name   = each.value.resource_group_name
  location              = each.value.location
  size                  = each.value.size
  admin_username        = each.value.admin_username
  network_interface_ids = each.value.network_interface_ids

  disable_password_authentication = true

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = file(pathexpand("~/.ssh/id_rsa.pub"))
  }

  os_disk {
    caching              = each.value.caching
    storage_account_type = each.value.storage_account_type
  }

  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = each.value.version
  }
}