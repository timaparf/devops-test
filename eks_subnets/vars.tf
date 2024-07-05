variable "vpc_id" {
  description = "VPC ID."
  type        = string
}

variable "subnet_cidrs" {
  description = "A list of subnets CIDRs."
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b", "us-west-1c"]
}

variable "availability_zones" {
  description = "A list of subnets CIDRs."
  type        = list(string)
  default     = ["10.0.0.0/22", "10.0.4.0/22", "10.0.8.0/22"]
}