variable "region" {
  default = "Region to deploy the resources"
  type    = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    ManagedBy   = "Terraform"
    Environment = "production"
  }
}

variable "vpc_cidrs" {
  description = "CIDR of VPC"
  type        = string
}

variable "subnet_cidrs" {
  description = "List of CIDR blocks for subnets"
  type        = list(string)
}

variable "cluster_name" {
  type        = string
  description = "Name of EKS Cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name of Node group in EKS cluster"
}

variable "desired_nodes" {
  type        = number
  description = "Number of desired nodes"
}

variable "max_nodes" {
  type        = number
  description = "Number of maximum nodes"
}

variable "min_nodes" {
  type        = number
  description = "Number of minimum nodes"
}