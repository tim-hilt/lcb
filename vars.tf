variable "ingress_controller_namespace" {
  type        = string
  description = "The ingress controllers namespace (it will be created if needed)."
  default     = "ingress"
}

variable "monitoring_namespace" {
  type        = string
  description = "The name of the monitoring namespace (it will be created if needed)."
  default     = "monitoring"
}

variable "kubernetes_config_file" {
  type        = string
  description = "The Kubernetes config-file to be used"
  default     = "~/.kube/config"
}

variable "with_logging" {
  type        = bool
  description = "Whether or not to provision logging"
  default     = true
}
