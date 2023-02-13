variable "ingress_controller_namespace" {
  type        = string
  description = "Theingress controllers namespace (it will be created if needed)."
  default     = "ingress"
}
