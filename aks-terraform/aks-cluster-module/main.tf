# aks-cluster/main.tf

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = var.aks_cluster_name
  location            = var.cluster_location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name            = "default"
    node_count      = 2
    enable_auto_scaling = true
    vm_size         = "Standard_D2_v2"
    min_count       = 1
    max_count       = 3
  }

  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }
}

