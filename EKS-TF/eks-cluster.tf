resource "aws_s3_bucket" "tetris_bucket" {
  bucket = var.bucket_name  # Use a variable to specify the bucket name
  acl    = "private"

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name        = "TetrisBucket"
    Environment = var.environment
  }
} 
resource "aws_eks_cluster" "eks-cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.EKSClusterRole.arn
  vpc_config {
    subnet_ids         = [data.aws_subnet.subnet.id, aws_subnet.public-subnet2.id]
    security_group_ids = [data.aws_security_group.sg-default.id]
  }

  version = 1.28

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy]
}

