output "kubernetes_name" {
  value       = civo_kubernetes_cluster.example.name
  description = "The name of the Kubernetes cluster"
}

output "kubernetes_api_endpoint" {
  value       = civo_kubernetes_cluster.example.api_endpoint
  description = "The API endpoint of the Kubernetes cluster"
}

output "kubernetes_kubeconfig" {
  value       = civo_kubernetes_cluster.example.kubeconfig
  description = "The KubeConfig for the Kubernetes cluster"
  sensitive   = true
}
