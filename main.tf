/*
Make VPC with subnet and firewall.
The GCE instance running the application will be in this VPC.
*/
module "vpc" {
    source = "./vpc"

    region = "us-west1"
    project_name = "${var.project_name}"
    credentials = "credentials.json"
    owner = "${var.owner}"
    subnet_cidr = "10.0.0.0/24"
    vpc_name = "${var.vpc_name}"
}

/*
Create source repo.
After google repository is created, it will have to be configured.
Documentation here: https://cloud.google.com/source-repositories/docs/adding-repositories-as-remotes
*/
module "repo" {
    source = "./repo"
  
    credentials = "credentials.json"
    project_name = "${var.project_name}"
    region = "us-west1"
    repo_name = "${var.repo_name}"
}

/*
Create Cloud Build trigger.
This creates a container image from the repo on certain conditions (e.g. push to master).
*/
module "build-trigger" {
    source = "./build-trigger"

    project_name = "${var.project_name}"
    repo_name = "${module.repo.repo_name}"
    branch_name = "master"
    credentials = "credentials.json"
    subnet = "${module.vpc.subnetwork_name}"
}