resource "azurerm_kubernetes_cluster" "mwcluster" {
  name                = "mwcluster"
  location            = "eastus"
  resource_group_name = "aadds-rg"
  dns_prefix          = "mwcluster1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.mwcluster.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.mwcluster.kube_config_raw

  sensitive = true
}

data "azurerm_container_registry" "mwapp" {
  name                = "mwapp"
  resource_group_name = "aadds-rg"
}

# add the role to the identity the kubernetes cluster was assigned
resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = data.azurerm_container_registry.mwapp.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.mwcluster.kubelet_identity[0].object_id
}