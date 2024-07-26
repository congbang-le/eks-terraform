module "eks-fargate" {
  source               = "../../modules/eks-fargate"
  region               = "ap-southeast-1"
  vpc_cidrs            = "10.0.128.0/17"
  subnet_cidrs         = ["10.0.128.0/18", "10.0.192.0/18"]
  cluster_name         = "Cluster-Fargate-Demo"
  fargate_profile_name = "Fargate-Profile-Demo"
}