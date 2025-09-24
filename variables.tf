variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Region to deploy GKE cluster"
  type        = string
  default     = "us-central1"
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "asciiartify-gke"
}

variable "machine_type" {
  description = "Type of VM to use for nodes"
  type        = string
  default     = "e2-medium"
}

variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
  default     = 3
}

variable "network" {
  description = "Name of the VPC network"
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Name of the subnetwork"
  type        = string
  default     = "default"
}
