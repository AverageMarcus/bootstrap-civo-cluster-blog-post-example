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
}
