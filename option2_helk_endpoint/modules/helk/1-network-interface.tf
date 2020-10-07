resource "azurerm_public_ip" "helk-external" {
  name                    = "${var.prefix}-helk-external"
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30
}

resource "azurerm_network_interface" "primary" {
  name                    = "${var.prefix}-helk-primary"
  location                = var.location
  resource_group_name     = var.resource_group_name
  internal_dns_name_label = local.virtual_machine_name
  #network_security_group_id = "${azurerm_network_security_group.vm_security_group.id}"

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "static"
    private_ip_address            = var.helkprivate_ip_address
    public_ip_address_id          = azurerm_public_ip.helk-external.id
  }
}
