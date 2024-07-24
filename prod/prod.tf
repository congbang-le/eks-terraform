module "eks-vpc" {
  source          = "../module/eks-vpc"
  region          = "ap-southeast-1"
  vpc_cidrs       = "10.0.0.0/16"
  subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  cluster_name    = "EKS-Cluster-Demo"
  node_group_name = "EKS-Node-Group-Demo"
  desired_nodes   = 1
  max_nodes       = 1
  min_nodes       = 1
}