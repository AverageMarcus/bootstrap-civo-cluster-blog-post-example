terraform {
  required_providers {
    civo = {
      source  = "civo/civo"
      version = ">= 1.1.3"
    }
    flux = {
      source  = "fluxcd/flux"
      version = ">= 1.2"
    }
  }
}

provider "civo" {
  region = var.region
}

provider "flux" {
  kubernetes = {
    host = civo_kubernetes_cluster.example.api_endpoint

    client_certificate = base64decode(
      yamldecode(civo_kubernetes_cluster.example.kubeconfig).users[0].user.client-certificate-data
    )
    client_key = base64decode(
      yamldecode(civo_kubernetes_cluster.example.kubeconfig).users[0].user.client-key-data
    )
    cluster_ca_certificate = base64decode(
      yamldecode(civo_kubernetes_cluster.example.kubeconfig).clusters[0].cluster.certificate-authority-data
    )
  }

  git = {
    url = "https://github.com/${var.github_org}/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}
