terraform {
  backend "s3" {
    bucket         = "portfolio-ec2-terraform-state-bucket"                                       # Replace with your S3 bucket name
    key            = "portfolio-ec2-terraform-state-bucket/Terraform-Statefile/terraform.tfstate" # Path to store the state file within the bucket
    region         = "ap-south-1"                                                                 # AWS region where your S3 bucket is located
    dynamodb_table = "portfolio-terraform-lock-table"                                         # DynamoDB table for state locking
    encrypt        = true                                                                         # Enable encryption for the state file
  }
}

