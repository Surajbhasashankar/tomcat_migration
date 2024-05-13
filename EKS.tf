resource "aws_iam_role" "wty_github_action_role" {
  name = "wty_github_action_role"

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY
}

resource "aws_iam_role_policy_attachment" "wtyreports-AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.wty_github_action_role.name
}


variable "cluster_name" {
  default = "wtyreports_cluster"
  type = string
  description = "AWS EKS cluster for warranty reports applications"
 # nullable = false
}

resource "aws_eks_cluster" "wtyreports_cluster" {
  name     = var.cluster_name
  role_arn = aws_iam_role.wty_github_action_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.wtyreports-private-us-east-1a.id,
      aws_subnet.wtyreports-private-us-east-1b.id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.wtyreports-AmazonEKSClusterPolicy]
}
