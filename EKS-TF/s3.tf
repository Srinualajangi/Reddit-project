provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "tetris_bucket" {
  bucket = "tetris-bucket"
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
}

resource "aws_dynamodb_table" "lock_files" {
  name         = "Lock-Files"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "s3_bucket_name" {
  value = aws_s3_bucket.tetris_bucket.bucket
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.lock_files.name
}
