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
      args = "compute instances create-with-container repo-instance --zone=us-west1-b --machine-type=n1-standard-1 --subnet=${var.subnet} --service-account=468734881760-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=cos-stable-69-10895-71-0 --image-project=cos-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=repo-instance --container-image=gcr.io/$PROJECT_ID/$REPO_NAME:$SHORT_SHA --labels=container-vm=cos-stable-69-10895-71-0"
    }
  }
}