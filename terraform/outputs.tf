output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "cluster_id" {
  description = "EKS cluster ID."
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "region" {
  description = "AWS region"
  value       = var.aws_region
}

output "fsx_id" {
  description = "FSxN filsystem ID"
  value = aws_fsx_ontap_file_system.eksfs.id
}

