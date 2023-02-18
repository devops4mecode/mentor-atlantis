module "atlantis" {
  source  = "ringanta/ec2-atlantis/aws"
  version = "1.0.0"
  public_key          = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDI2lljsQwnugxxTgSETI1X2EDSCETNchn6fdatZ7Q2gcwjCItm/yBwFkjfezhcRHb1mCUJN4EfqTxODFZxJfKPNSS2bZXN9NuqQwOwu3BjLhJtPIO+HF+OZ9mzXSOjkAKcye7uEDjgciI7C3+P5pL1IvWHmNDRF5JxFrRfVuw9JEpk0Pha5qagd69TOo2nAP2nmS6GlnqBwJCcVgBVPqSSu1Qm9kkCx9dmIfG5h5zoLQHNuhrCwQCX1NSXQzxnnPdVwBvG8nmLcg2qdzj28jMS84BQDVj8PMvjA0vZbEtxJk7dzAuA2G2Pn6KAzcEWUvcxaiQDCKKgxOdDKitdhCNf najibradzuan@DevOps4Me-Global.local"
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