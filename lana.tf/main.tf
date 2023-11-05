resource "aws_eks_cluster" "eks" {
  name     = "sam-eks"
  role_arn = aws_iam_role.eks-role.arn

  vpc_config {
    subnet_ids = [aws_subnet.robo-1.id, aws_subnet.robo-2.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.AmazonEKSVPCResourceController,
  ]
}