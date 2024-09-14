# Define the AWS provider
provider "aws" {
  region  = var.aws_region                   # The AWS region to deploy resources in  

  # Uncomment and set these if using static credentials instead of a profile
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  # Optional: Configure a default shared credentials file and default region
  # shared_credentials_file = "/path/to/credentials/file"
  # region = "us-west-2"
}
