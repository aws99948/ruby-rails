resource "aws_iam_role" "ec2_role" {
  name = "ec2-role-for-ecs-ecr-s3"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "ecs_ecr_s3_policy" {
  name        = "ecs-ecr-s3-policy"
  description = "Policy for ECS, ECR, and S3 access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetRepositoryPolicy",
          "ecr:ListImages",
          "ecr:BatchCheckLayerAvailability",
          "ecr:GetAuthorizationToken",
          "ecs:RegisterTaskDefinition",
          "ecs:CreateCluster",
          "ecs:CreateService",
          "ecs:DescribeTasks",
          "ecs:ListClusters",
          "ecs:ListServices",
          "ecs:DescribeClusters",
          "ecs:DescribeServices",
          "s3:ListBucket",
          "s3:GetObject",
          "s3:PutObject",
        ],
        Effect   = "Allow",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "ecs_ecr_s3_policy_attachment" {
  name       = "ecs-ecr-s3-policy-attachment"
  policy_arn = aws_iam_policy.ecs_ecr_s3_policy.arn
  roles      = [aws_iam_role.ec2_role.name]
}

resource "aws_iam_instance_profile" "admin" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}