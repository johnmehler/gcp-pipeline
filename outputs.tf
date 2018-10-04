// VPC output
output "network_id" {
    value = "${module.vpc.subnetwork_name}"
}

// Repo output
output "repo_name" {
    value = "${module.repo.repo_name}"
}