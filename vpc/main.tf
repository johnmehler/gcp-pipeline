// Configure the Google Cloud provider
provider "google" {
	credentials = "${file("${var.credentials}")}"
	project		= "${var.project_name}"
	region		= "${var.region}"
}
// Create VPC
resource "google_compute_network" "vpc" {
	name                    = "${var.vpc_name}"
	auto_create_subnetworks = "false"
}
// Create Subnet
resource "google_compute_subnetwork" "subnet" {
	name			= "${var.vpc_name}-subnet"
	ip_cidr_range	= "${var.subnet_cidr}"
	network			= "${var.vpc_name}"
	depends_on		= ["google_compute_network.vpc"]
	region			= "${var.region}"
}
// VPC firewall configuration
resource "google_compute_firewall" "firewall" {
	name    = "${var.vpc_name}-firewall"
	network = "${google_compute_network.vpc.name}"
		allow {
		protocol = "icmp"
	}

	allow {
		protocol = "tcp"
		ports    = ["22","80","443"]
	}

	source_ranges = ["0.0.0.0/0"]
}