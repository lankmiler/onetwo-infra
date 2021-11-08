resource "kubernetes_namespace" "test" {
  metadata {
    labels = {
      mylabel = "test"
    }
    name = "test"
  }
}

resource "kubernetes_namespace" "prod" {
  metadata {
    labels = {
      mylabel = "prod"
    }
    name = "prod"
  }
}

resource "kubernetes_namespace" "db" {
  metadata {
    labels = {
      mylabel = "db"
    }
    name = "db"
  }
}