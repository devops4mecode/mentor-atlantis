module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"
  public_key          = "X
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "d04m-terraform-backend"
  versioning {
    enabled = true
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  read_capacity  = 10
  write_capacity = 10
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
