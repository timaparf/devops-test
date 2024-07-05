variable "cluster_name" {
  description = "The name of the cluster to be created"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version to use for the EKS cluster."
  type        = string
  default     = "1.30"
}

variable "subnets" {
  description = "A list of subnets to place the EKS cluster and workers within."
  type        = list(string)
}

variable "control_subnets" {
  description = "A list of subnets for controlplan. If not provided - workers are using var.subnets"
  type        = list(string)
  default     = []
}

variable "vpc_id" {
  description = "VPC where the cluster and workers will be deployed."
  type        = string
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled."
  type        = bool
  default     = false
}

variable "workers_min_size" {
  description = "Workers min size"
  type        = number
  default     = 2
}

variable "workers_max_size" {
  description = "Workers max size"
  type        = number
  default     = 5
}

variable "workers_desired_size" {
  description = "Workers desired size"
  type        = number
  default     = 3
}