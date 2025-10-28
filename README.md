# Terraform GCP GKE Demo Project

This repository demonstrates deploying a Google Kubernetes Engine (GKE) cluster on Google Cloud Platform (GCP) using Terraform. It includes a simple Nginx deployment and a Hello World service.

---

## Table of Contents

- [Prerequisites](#prerequisites)  
- [Project Structure](#project-structure)  
- [Setup Instructions](#setup-instructions)  
- [Terraform Commands](#terraform-commands)  
- [Kubernetes Commands](#kubernetes-commands)  
- [Cleanup](#cleanup)  
- [Screenshots / Proof](#screenshots--proof)  

---

## Prerequisites

- [Google Cloud Platform account](https://cloud.google.com/)  
- [Terraform installed](https://www.terraform.io/downloads.html)  
- [gcloud CLI installed](https://cloud.google.com/sdk/docs/install)  
- [kubectl installed](https://kubernetes.io/docs/tasks/tools/)  
- A GCP service account key JSON file with the required permissions  

---


> **Note:** The `.terraform` folder and credentials JSON file are **ignored** to prevent committing secrets or large binaries to GitHub.

---

## Setup Instructions

1. Clone the repository:  

```bash
git clone https://github.com/lutherdpage/terraform-gcp-gke-demo.git
cd terraform-gcp-gke-demo

terraform init

terraform plan -var="project_id=<YOUR_PROJECT_ID>" \
-var="credentials_file=<PATH_TO_CREDENTIALS_JSON>" \
-var="region=us-central1" \
-var="zone=us-central1-a"

terraform apply -var="project_id=<YOUR_PROJECT_ID>" \
-var="credentials_file=<PATH_TO_CREDENTIALS_JSON>" \
-var="region=us-central1" \
-var="zone=us-central1-a"

Terraform Commands

terraform init – Download required providers and initialize the project.

terraform plan – Preview changes Terraform will make.

terraform apply – Deploy resources to GCP.

terraform destroy – Remove all deployed resources to avoid charges.

# Connect to the cluster
gcloud container clusters get-credentials demo-gke-cluster --zone us-central1-a --project <YOUR_PROJECT_ID>

# Check nodes
kubectl get nodes

# Check pods
kubectl get pods

# Check services
kubectl get svc

terraform destroy -var="project_id=<YOUR_PROJECT_ID>" \
-var="credentials_file=<PATH_TO_CREDENTIALS_JSON>" \
-var="region=us-central1" \
-var="zone=us-central1-a"


## Project Structure

