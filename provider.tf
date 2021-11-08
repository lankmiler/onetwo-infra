provider "kubernetes" {
  config_path = "~/.kube/config"
  config_context_cluster   = "minikube"
}

provider "google" {
  project     = "vocal-capsule-328318"
  region      = "us-central1"
}
