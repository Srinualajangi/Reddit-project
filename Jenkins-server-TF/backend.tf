terraform {
  backend "s3" {
    bucket         = "reddit-buck1"
    region         = "us-east-1"
    key            = "End-to-End-Kubernetes-DevSecOps-Tetris-Project/Jenkins-Server-TF/terraform.tfstate"
    dynamodb_table = "reddit-table"
    encrypt        = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
    }
  }
}
