terraform {
 backend "s3" {
    bucket         = "tetris-bucket"
    region         = "us-east-1"
    key            = "EKS-DevSecOps-Tetris-Project/EKS-TF/terraform.tfstate"
    dynamodb_table = "Lock-Files"
    encrypt        = true
    depends_on     = [aws_s3_bucket.tetris_bucket, aws_dynamodb_table.lock_files]
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 2.7.0"
      source  = "hashicorp/aws"
   }
  }
}
