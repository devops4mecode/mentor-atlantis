##NETWORKING SETUP

# VPC

#Subnet

#Route

#Security Gorup

#IGW

#NATGateway


module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"
  key_name = "linux-sea-key"
  instance_type = "t3.medium"
  attach_admin_policy = true
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

resource "aws_s3_bucket" "bucket" {
    bucket = "do4m-dummy-bucket"
}
