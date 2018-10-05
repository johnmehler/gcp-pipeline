// Configure the Google Cloud provider
provider "google" {
	credentials = "${file("${var.credentials}")}"
	project		= "${var.project_name}"
	region		= "${var.region}"
}

// Create the Cloud Build triggers
resource "google_cloudbuild_trigger" "build_trigger" {
  trigger_template {
    branch_name = "${var.branch_name}"
    project     = "${var.project_name}"
    repo_name   = "${var.repo_name}"
  }
  build {
    images = ["gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA"]
    step {
      name = "gcr.io/cloud-builders/docker"
      args = "build -t gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA -f Dockerfile ."
    }
    step {
      name = "gcr.io/cloud-builders/docker"
      args = "push gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA"
    }
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = "compute instances create-with-container ${var.repo_name}-$SHORT_SHA --zone=${var.zone} --machine-type=${var.machine_type} --subnet=${var.subnet} --image-project=cos-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --container-image=gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA"
    }
  }
}