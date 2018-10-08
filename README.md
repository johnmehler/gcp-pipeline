1. Create a terraform service account


This repository can be used to create a CI/CD pipeline for GCP. This project relies uses Docker to build and push the images to Google Container Registry. A requirements.txt file and Dockerfile must be included in the repository for the Build Trigger not to fail. Examples of these files can be found in the /helpers/ folder.

The workflow is:

1. Create a VPC, subnet, firewall rule. 
2. Create a repository.
3. Create a cloud build trigger. The cloud build trigger creates an image, pushes it to the container registry, and builds a GCE instance with ContainerOS using the created image.


TODO:

1. Create IAM/API modules. Currently, this project only works if API scopes have already been enabled. Testing is currently being done implement this.
2. Add if_not_exists logic to existing resources, in case resources were created through a different process.
3. Add integration tests for Terraform code.
4. Update Build Trigger to have tests.
5. Pretty-fy final Build Trigger step. Current code was machine generated, there is a lot of code that can be deleted and/or parameterized.