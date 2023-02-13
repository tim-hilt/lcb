provider "helm" {
  kubernetes {
    host = kind_cluster.this.endpoint

    client_certificate     = kind_cluster.this.client_certificate
    client_key             = kind_cluster.this.client_key
    cluster_ca_certificate = kind_cluster.this.cluster_ca_certificate
  }
}

resource "helm_release" "ingress_controller" {
  name       = "ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  namespace        = "ingress"
  create_namespace = true

  values = [
    file("values/ingress_controller.values.yaml")
  ]

  depends_on = [kind_cluster.this]
}

# resource "null_resource" "wait_for_ingress" {
#   triggers = {
#     key = uuid()
#   }
#
#   provisioner "local-exec" {
#     command = <<EOF
#       printf "\nWaiting for the nginx ingress controller...\n"
#       kubectl wait --namespace ingress \
#         --for=condition=ready pod \
#         --selector=app.kubernetes.io/component=controller \
#         --timeout=90s
#     EOF
#   }
#
#   depends_on = [helm_release.ingress_controller]
# }
#
# resource "helm_release" "monitoring" {
#   name       = "monitoring"
#   repository = "https://prometheus-community.github.io/helm-charts"
#   chart      = "kube-prometheus-stack"
#
#   values = [
#     file("values/monitoring.values.yaml")
#   ]
#
#   depends_on = [null_resource.wait_for_ingress]
# }
