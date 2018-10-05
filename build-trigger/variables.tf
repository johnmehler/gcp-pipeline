variable "region" {
    description = "The region of the GCP project"
    default = "us-west1"
}

variable "repo_name" {
    description = "The name of your repository"
    default = "repo"
}

variable "branch_name" {
    description = "Which branch to monitor"
    default = "master"
}


variable "credentials" {
    description = "The filename of your credentials file"
    default = "credentials.json"
}

variable "project_name" {
    description = "variable that holds the name of the project"
    default = "jmehler-cicd"
}

variable "subnet" {
    description = "Subnet to host GCE instance"
}

variable "zone" {
    default = "us-west1-b"
}
variable "machine_type" {
    default = "n1-standard-1"
}
