output "cluster_name" {
  description = "Name of the GKE cluster"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  value       = google_container_cluster.primary.endpoint
}

output "client_certificate" {
  description = "Base64 encoded client certificate"
  value       = google_container_cluster.primary.master_auth[0].client_certificate
  sensitive   = true
}

output "client_key" {
  description = "Base64 encoded client key"
  value       = google_container_cluster.primary.master_auth[0].client_key
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded cluster CA certificate"
  value       = google_container_cluster.primary.master_auth[0].cluster_ca_certificate
}

output "kubeconfig" {
  description = "Kubeconfig for accessing the cluster"
  value       = <<EOT
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: ${google_container_cluster.primary.master_auth[0].cluster_ca_certificate}
    server: https://${google_container_cluster.primary.endpoint}
  name: ${google_container_cluster.primary.name}
contexts:
- context:
    cluster: ${google_container_cluster.primary.name}
    user: ${google_container_cluster.primary.name}
  name: ${google_container_cluster.primary.name}
current-context: ${google_container_cluster.primary.name}
kind: Config
preferences: {}
users:
- name: ${google_container_cluster.primary.name}
  user:
    client-certificate-data: ${google_container_cluster.primary.master_auth[0].client_certificate}
    client-key-data: ${google_container_cluster.primary.master_auth[0].client_key}
EOT
  sensitive = true
}
