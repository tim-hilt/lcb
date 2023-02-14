variable "ingress_controller_namespace" {
  type        = string
  description = "The ingress controllers namespace (it will be created if needed)."
  default     = "ingress"
}

variable "kubernetes_config_file" {
  type        = string
  description = "The Kubernetes config-file to be used"
  default     = "~/.kube/config"
}
