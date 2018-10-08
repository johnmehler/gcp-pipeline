// VPC output
output "network_id" {
    value = "${module.vpc.subnetwork_name}"
}


// Repo output
output "repo_name" {
    value = "${module.repo.repo_name}"
}


// Trigger output
output "branch" {
  value = "${module.build-trigger.branch}"
}
output "project" {
  value = "${module.build-trigger.project}"
}
output "repo" {
  value = "${module.build-trigger.repo}"
}
