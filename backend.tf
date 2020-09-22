terraform {
  backend "s3" {
    bucket = "blockchain-project1"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}