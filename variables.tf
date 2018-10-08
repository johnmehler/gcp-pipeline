// Global vars
variable "project_name" {
  description = "Name of the GCP project to work in"
  default = "jmehler-pipeline"
}
variable "owner" {
  description = "The owner of something or other"
  default = "jmehler"
}

// VPC vars
variable "vpc_name" {
  description = "The name of the VPC to be created."
  default = "pipeline-vpc"
}

// Repo vars
variable "repo_name" {
  description = "The name of the repository to be created"
  default = "repo"
}

// Build trigger vars
variable "zone" {
    default = "us-west1-b"
}
variable "machine_type" {
    default = "n1-standard-1"
}