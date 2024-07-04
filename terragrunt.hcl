inputs = {
  account_id       = ""
  environment_name = "production"
  vpc_cidr         = "10.5.0.0/16"

  tags = {
    Environment = "production"
    ManagedBy   = "terraform"
  }
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
provider "aws" {
    profile = "prod"
    region  = "us-east-1"
}
EOF
}

generate "variables-region" {
  path = "variables-region.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
variable "region" {
  description = "The AWS region to create resources in."
  default     = "us-east-1"
  type        = string
}

variable "environment_name" {
  description = "Environment"
  default     = "production"
}

variable "profile" {
  description = "Profile to use aws creds"
  default     = "prod"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "VPC main CIDR"
}

variable "tags" {
  type        = map(string)
  description = "Common tags"
  default     = {}
}

variable "account_id" {
  description = "The 12 digit of aws account ID"
  type        = string
}

EOF
}

remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket         = "terraform-state-prod"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}
