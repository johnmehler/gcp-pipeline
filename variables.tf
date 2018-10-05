// Global vars
variable "project_name" {
  description = "Name of the GCP project to work in"
  default = "jmehler-cicd"
}

// VPC vars
variable "owner" {
  description = "The owner of something or other"
  default = "jmehler"
}
variable "vpc_name" {
  description = "The name of the VPC to be created."
}

// Repo vars
variable "repo_name" {
  description = "The name of the repository to be created"
}

// Build trigger vars
variable "zone" {
    default = "us-west1-b"
}
variable "machine_type" {
    default = "n1-standard-1"
}