provider "google" {
  credentials = file(var.credentials_file)  # Path to your JSON key
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

# Create VPC network
resource "google_compute_network" "vpc_network" {
  name                    = "my-vpc-network"
  auto_create_subnetworks = true
}

# Create GKE cluster
resource "google_container_cluster" "primary" {
  name                     = "demo-gke-cluster"
  location                 = var.zone
  network                  = google_compute_network.vpc_network.name
  remove_default_node_pool = true
  initial_node_count       = 1

  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"
}

# Create node pool for cluster
resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.primary.name
  location = var.zone
  node_count = 2

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 50
    image_type   = "COS_CONTAINERD"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}

