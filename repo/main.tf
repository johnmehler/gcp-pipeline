provider "google" {
	credentials = "${file("${var.credentials}")}"
	project		= "${var.project_name}"
	region		= "${var.region}"
}

resource "google_sourcerepo_repository" "repo" {
  name = "${var.repo_name}"
}
