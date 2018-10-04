variable "project_name" {
    description = "variable that holds the name of the project"
    default = "jmehler-cicd"
}

variable "credentials" {
    default = "credentials.json"
}


variable "repo_name" {
    description = "The name of the repository to be created"
}

variable "region" {
    description = "The region that the resources ar based in"
    default = "us-west1"
}
