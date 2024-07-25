module "eks-ec2" {
  source          = "../../module/eks-ec2"
  region          = "ap-southeast-1"
  vpc_cidrs       = "10.0.0.0/16"
  subnet_cidrs    = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  cluster_name    = "Cluster-EC2-Demo"
  node_group_name = "Node-Group-Demo"
  desired_nodes   = 1
  max_nodes       = 1
  min_nodes       = 1
}