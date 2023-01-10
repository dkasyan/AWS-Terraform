terraform {
  required_version = "~> 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  #backend "s3" {
  #  bucket = "backend-primei.it"
  #  key    = "prod/terraform.tfstate"
  #  region = "eu-west-1"
  }
#}

provider "aws" {
  region = "eu-west-1"
  profile = "primei.it"
}

provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
  profile = "primei.it"
} 