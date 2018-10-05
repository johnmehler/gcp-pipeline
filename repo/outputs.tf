output "repo_name" {
    value = "${google_sourcerepo_repository.repo.name}"
}
output "repo_url" {
    value = "${google_sourcerepo_repository.repo.url}"
}