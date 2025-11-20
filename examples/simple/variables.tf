// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

variable "name" {
  description = "Name for the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running"
  type        = number
  default     = 1
}

variable "availability_zone" {
  description = "Availability zone for the subnet"
  type        = string
  default     = "us-east-2a"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet1_cidr_block" {
  description = "CIDR block for subnet1"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet2_cidr_block" {
  description = "CIDR block for subnet2"
  type        = string
  default     = "10.0.2.0/24"
}

variable "subnet2_availability_zone" {
  description = "Availability zone for subnet2"
  type        = string
  default     = "us-east-2b"
}

variable "security_group_name_prefix" {
  description = "Name prefix for the security group"
  type        = string
  default     = "ecs-service-sg-"
}

variable "ingress_ip_protocol" {
  description = "IP protocol for ingress rule"
  type        = string
  default     = "tcp"
}

variable "ingress_from_port" {
  description = "From port for ingress rule"
  type        = number
  default     = 80
}

variable "ingress_to_port" {
  description = "To port for ingress rule"
  type        = number
  default     = 80
}

variable "ingress_cidr_ipv4" {
  description = "CIDR IPv4 for ingress rule"
  type        = string
  default     = "0.0.0.0/0"
}

variable "egress_ip_protocol" {
  description = "IP protocol for egress rule"
  type        = string
  default     = "-1"
}

variable "egress_from_port" {
  description = "From port for egress rule"
  type        = number
  default     = 0
}

variable "egress_to_port" {
  description = "To port for egress rule"
  type        = number
  default     = 0
}

variable "egress_cidr_ipv4" {
  description = "CIDR IPv4 for egress rule"
  type        = string
  default     = "0.0.0.0/0"
}

variable "ecs_cluster_name" {
  description = "Name for the ECS cluster"
  type        = string
  default     = "my-cluster"
}

variable "ecs_task_family" {
  description = "Family name for the ECS task definition"
  type        = string
  default     = "my-task-definition"
}

variable "container_name" {
  description = "Name for the container in the ECS task definition"
  type        = string
  default     = "nginx"
}

variable "container_image" {
  description = "Container image for the ECS task"
  type        = string
  default     = "nginx:latest"
}

variable "assign_public_ip" {
  description = "Whether to assign public IP to tasks"
  type        = bool
  default     = false
}
