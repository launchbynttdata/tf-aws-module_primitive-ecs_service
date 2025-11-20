name          = "my-ecs-service"
desired_count = 2

vpc_cidr_block = "10.0.0.0/16"

subnet1_cidr_block = "10.0.1.0/24"

subnet2_cidr_block        = "10.0.2.0/24"
subnet2_availability_zone = "us-east-2b"

security_group_name_prefix = "ecs-service-sg-"

ingress_ip_protocol = "tcp"
ingress_from_port   = 80
ingress_to_port     = 80
ingress_cidr_ipv4   = "0.0.0.0/0"

egress_ip_protocol = "-1"
egress_from_port   = -1
egress_to_port     = -1
egress_cidr_ipv4   = "0.0.0.0/0"

ecs_cluster_name = "my-cluster"

ecs_task_family = "my-task-definition"
container_name  = "nginx"
container_image = "nginx:latest"

assign_public_ip = false
