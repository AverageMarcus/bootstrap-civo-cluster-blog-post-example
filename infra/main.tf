resource "civo_network" "example" {
  label = "example-network"
}

resource "civo_firewall" "example" {
  name                 = "example-firewall"
  create_default_rules = true
  network_id           = civo_network.example.id
}

resource "civo_kubernetes_cluster" "example" {
  name        = "ExampleCluster"

  firewall_id = civo_firewall.example.id
  network_id  = civo_network.example.id

  cluster_type       = "k3s"
  kubernetes_version = "1.30.5-k3s1"
  cni                = "flannel"

  write_kubeconfig = true

  pools {
    size       = "g4s.kube.small"
    node_count = 2
  }

  # This allows us to make use of cluster autoscaler.
  # If you don't plan to use cluster autoscaler you can remove this `lifecycle` block.
  lifecycle {
    ignore_changes = [
      pools["node_count"],
    ]
  }
}

resource "flux_bootstrap_git" "example" {
  embedded_manifests = true
  path               = "flux"
}
