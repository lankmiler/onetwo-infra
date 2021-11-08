resource "kubernetes_deployment" "app" {
  metadata {
    name      = var.app
    namespace = var.app_namespace
    labels = {
      app = "frontend"
    }
  }
  spec {
    replicas = 2

    selector {
      match_labels = {
        app = var.app
      }
    }
    template {
      metadata {
        labels = {
          app = var.app
        }
      }
      spec {
        restart_policy = "Always"

        image_pull_secrets {
            name = "gcr-imagepullsecret"
        }

        container {
          image             = var.image
          image_pull_policy = "Always"

          env {
            name  = "BUILD_STAGE"
            value = var.mode
          }  

	  
          name = "frontend" 
          port {
            name           = "port-${var.port}"
            container_port = var.port
            # host_ip = "127.0.0.1"
            # host_port = var.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name      = var.app
    namespace = var.app_namespace
  }
  spec {
    selector = {
      app = kubernetes_deployment.app.metadata.0.labels.app
      #"app.kubernetes.io/name"  =  "ingress-nginx"
      #"app.kubernetes.io/part-of" =  "ingress-nginx"
    }
    port {
      name        = var.app
      port        = var.port
      protocol    = "TCP"
      # target_port = var.port
      #node_port   = "30001"
    }
    type = "NodePort"
  }
}

