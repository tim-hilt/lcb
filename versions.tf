terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = ">= 0.0.16"
    }

    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.8.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.2.1"
    }
  }

  required_version = ">= 1.3.7"
}
