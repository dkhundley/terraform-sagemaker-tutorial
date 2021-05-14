terraform {
  backend "s3" {
    bucket = "dkhundley-terraform-test"
    key = "terraform-sagemaker-notebook.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}