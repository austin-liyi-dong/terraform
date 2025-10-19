#create ECR
resource "aws_ecr_repository" "pro_reservation" {
  name                 = "pro_reservation"
  image_scanning_configuration {
    scan_on_push = true
  }
}

#create ECS cluster
resource "aws_ecs_cluster" "reservation_PRO" {
  name = "reservation_PRO"
  description = "austin test 1"
}

resource "aws_ecs_cluster_capacity_providers" "pro_reservation" {
  cluster_name = aws_ecs_cluster.pro_reservation

  capacity_providers = [aws_ecs_capacity_provider.ec2,aws_ecs_capacity_provider.fargate]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 10
    capacity_provider = aws_ecs_capacity_provider.fargate
  }


