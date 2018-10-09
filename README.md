This repository can be used to create a CI/CD pipeline for GCP. This project relies uses Docker to build and push the images to Google Container Registry. A requirements.txt file and Dockerfile must be included in the repository for the Build Trigger not to fail. Examples of these files can be found in the /helpers/ folder.

The workflow is:

1. Create a VPC, subnet, firewall rule. 
2. Create a repository.
3. Create a cloud build trigger that listens to the repository. Whenever something is pushed to master, the cloud build trigger creates an image, pushes it to the container registry, and builds a GCE instance with ContainerOS using the created image.

Note: It does not delete older GCE instances when a new image is created-- cleanup is required. In addition, there is no static IP assigned, so to see changes you'll need to 
