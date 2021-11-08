resource "kubernetes_persistent_volume" "mysql_pv_volume" {
  metadata {
    name = "mysql-pv-volume"
    labels = {
      type = "local"
    }
  }
 
  spec {
    capacity = {
      storage = "500M"
    }
    storage_class_name = "manual"
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/mnt/data"
      }
    }
  }

  
}

resource "kubernetes_persistent_volume_claim" "mysql_pvc" {
  metadata {
    name = "mysql-pv-claim"
    namespace = "db"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "manual"
    resources {
      requests = {
        storage = "500M"
      }
    }
    volume_name = "mysql-pv-volume"
  }
}

resource "kubernetes_deployment" "mysql" {
  metadata {
    name = "mysql"
    namespace = "db"
  }

  spec {
    selector {
      match_labels = {
        app = "mysql"	      
      } 
    } 

    strategy {
      type = "Recreate"
    }
	
    template {
      metadata {
        labels = {
          app = "mysql"
	      }
      }

       spec {	
        restart_policy = "Always"
        container {
          image = "mysql:5.6"
          name  = "mysql"

          env {
            name = "MYSQL_ROOT_PASSWORD"
            value = var.mysql_root_pass
          }

          port {
            name           = "mysql"
            container_port = 3306
          }

          volume_mount {
            name       = "mysql-persistent-storage"
            mount_path = "/var/lib/mysql"
          }
        } 
        volume {
          name = "mysql-persistent-storage"
          persistent_volume_claim {
            claim_name = "${kubernetes_persistent_volume_claim.mysql_pvc.metadata.0.name}"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name = "mysql"
    namespace = "db"
  }
  spec {
      selector = {
	 app = "mysql"
      }

      port {
        port = 3306
      }

      cluster_ip = "None"
  }
}
