variable "region" {
    description = "The region the project is in"
    default = "us-west1"
}

variable "project_name" {
    description = "The name of the project"
    default = "jmehler-cicd"
} 
variable "credentials" {
    description = "Name of credentials file"
    default = "credentials.json"
}
variable "owner" {
    description = "Name of the owner of the project"
    default = "jmehler"
} 
variable "subnet_cidr" {
    description = "Subnet CIDR range"
    default = "10.10.0.0/24"
}
variable "vpc_name" {
    description = "Name of the VPC"
}