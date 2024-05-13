provider "aws" {
  region = "us-east-1"
 #  alias  = "east"

}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 4.0"
    }
  }
}