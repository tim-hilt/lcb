terraform {
  required_providers {
    kind = {
      source = "tehcyx/kind"
      version = "~> 0.0.16"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "default" {
  name = "lcb"
  wait_for_ready = true
  node_image = "kindest/node:v1.26.0"
}
