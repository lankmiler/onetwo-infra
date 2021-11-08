locals {
	dockerconfigjson = {
		"auths": {
			"https://gcr.io" = {
				email    = "pavel.lankmiler@gmail.com"
				username = "_json_key"
				password = trimspace(file(pathexpand("key.json")))
				auth     = base64encode(join(":",["_json_key", trimspace(file(pathexpand("key.json")))]))
			}
		}
	}
}
resource "kubernetes_secret" "gcr-imagepullsecret" {
	metadata {
		name      = "gcr-imagepullsecret"
		namespace = var.app_namespace
	}
	data = {
		".dockerconfigjson" = jsonencode(local.dockerconfigjson)
	}
	type = "kubernetes.io/dockerconfigjson"
}