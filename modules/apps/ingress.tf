resource "kubernetes_ingress" "ingress" {
  metadata {
    name      = var.app
    namespace = var.app_namespace
    labels    = { app = var.app }
    annotations = {
      #"kubernetes.io/ingress.class"                         = "nginx"
      "nginx.ingress.kubernetes.io/rewrite-target"          = "/"
      #"nginx.ingress.kubernetes.io/ssl-redirect"            = "false"
      #"nginx.ingress.kubernetes.io/enable-real-ip"         = "true"
      #"kubernetes.io/rewrite-target"                       = "/"
      #"nginx.ingress.kubernetes.io/rewrite-target"         = "/"
    }
  }
  spec {
    rule {
      #host = "dev.onetwocareer-local.com"
      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.service.metadata[0].name
            service_port = var.port
          }
        }
      }
    }
  }
}
