erraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.75"  # Evita versiones 4.x y 5.x por bugs con LocalStack
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  s3_force_path_style         = true

  endpoints {
    s3 = "http://localhost:4566"
    ec2            = "http://localhost:4566"
  }
}
module "mi_bucket" {
  source      = "./modules/mi-recurso"
  bucket_name = "bucket-desde-modulo"
}
resource "aws_s3_bucket" "test_bucket" {
  bucket = "mi-bucket-localstack"
}

resource "aws_instance" "local_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}
