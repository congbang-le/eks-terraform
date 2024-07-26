module "eks-ec2" {
  source          = "../../module/eks-ec2"
  region          = "ap-southeast-1"
  vpc_cidrs       = "10.0.0.0/17"
  subnet_cidrs    = ["10.0.0.0/18", "10.0.64.0/18"]
  cluster_name    = "Cluster-EC2-Demo"
  node_group_name = "Node-Group-Demo"
  desired_nodes   = 1
  max_nodes       = 1
  min_nodes       = 1
}