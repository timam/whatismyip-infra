resource "helm_release" "public-alb-ingress" {
  chart     = "../charts/public-alb"
  name      = "public-alb-ingress"
  namespace = var.namespace
  set {
    name  = "public_subnet1"
    value = var.public_subnet1
  }
  set {
    name  = "public_subnet2"
    value = var.public_subnet2
  }
  set {
    name  = "public_subnet3"
    value = var.public_subnet3
  }
  set {
    name  = "certificate_arn"
    value = var.certificate_arn
  }
  set {
    name  = "healthcheck_path"
    value = var.healthcheck_path
  }
  values = [var.values]
}
