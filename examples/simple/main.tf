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

module "vpc" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/vpc/aws"
  version = "1.0.0"

  cidr_block = var.vpc_cidr_block
}

module "subnet1" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/subnet/aws"
  version = "1.0.0"

  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet1_cidr_block
  availability_zone = var.availability_zone
}

module "subnet2" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/subnet/aws"
  version = "1.0.0"

  vpc_id            = module.vpc.vpc_id
  cidr_block        = var.subnet2_cidr_block
  availability_zone = var.subnet2_availability_zone
}

module "security_group" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/security_group/aws"
  version = "0.2.0"

  vpc_id      = module.vpc.vpc_id
  name_prefix = var.security_group_name_prefix
}

module "ingress_rule" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/vpc_security_group_ingress_rule/aws"
  version = "0.1.0"

  security_group_id = module.security_group.id
  ip_protocol       = var.ingress_ip_protocol
  from_port         = var.ingress_from_port
  to_port           = var.ingress_to_port
  cidr_ipv4         = var.ingress_cidr_ipv4
}

module "egress_rule" {
  source  = "terraform.registry.launch.nttdata.com/module_primitive/vpc_security_group_egress_rule/aws"
  version = "0.1.0"

  security_group_id = module.security_group.id
  ip_protocol       = var.egress_ip_protocol
  from_port         = var.egress_from_port
  to_port           = var.egress_to_port
  cidr_ipv4         = var.egress_cidr_ipv4
}

resource "aws_ecs_cluster" "this" {
  name = var.ecs_cluster_name
}

module "ecs_task" {
  source  = "terraform.registry.launch.nttdata.com/module_collection/ecs_task/aws"
  version = "1.0.0"

  ecs_task_family = var.ecs_task_family
  container_name  = var.container_name
  container_image = var.container_image

  # Let the module create the roles instead of providing ARNs
  create_task_role      = true
  create_execution_role = true
}

module "ecs_service" {
  source = "../../"

  name                  = var.name
  cluster               = aws_ecs_cluster.this.arn
  task_definition       = module.ecs_task.task_definition_arn
  desired_count         = var.desired_count
  network_configuration = local.network_configuration
}
