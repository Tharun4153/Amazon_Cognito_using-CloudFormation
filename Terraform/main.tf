provider "aws" {
  region = "ap-south-1"  # Change this to your desired region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-cloudformationbuckettysra"
  acl    = "private"  # Adjust ACL permissions as needed
}

resource "aws_s3_bucket_object" "cloudformation_template" {
  bucket = aws_s3_bucket.my_bucket.id
  key    = "aws_cognito_creation_hostedui.yaml"  # Name of the object in S3
  source = "F:/devepos/class notes/project 6/aws_cognito_creation_hostedui.yaml"  # Path to your local CloudFormation template
}

resource "aws_cloudformation_stack" "my_stack" {
  name         = "my-stack-name"
  template_url = "https://my-cloudformationbucketty.s3.ap-south-1.amazonaws.com/aws_cognito_terra_creation_hostedui.yaml"  # Use the S3 bucket URL
  capabilities = ["CAPABILITY_IAM"]  # Add capabilities as needed
}

output "stack_id" {
  value = aws_cloudformation_stack.my_stack.id
}

