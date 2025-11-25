# Simple Example

This example provides a basic test case for the `tf-aws-module_primitive-vpc_security_group_ingress_rule` module, used primarily for integration testing.

## Features

- Single SSH ingress rule (port 22)
- IPv4 CIDR source
- Basic configuration

## Usage

```bash
terraform init
terraform plan -var-file=test.tfvars
terraform apply -var-file=test.tfvars
terraform destroy -var-file=test.tfvars
```

## Resources Created

- 1 VPC
- 1 Security Group
- 1 Security Group Ingress Rule

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.100 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.100.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform.registry.launch.nttdata.com/module_primitive/vpc/aws | ~> 1.0 |
| <a name="module_subnet1"></a> [subnet1](#module\_subnet1) | terraform.registry.launch.nttdata.com/module_primitive/subnet/aws | ~> 1.0 |
| <a name="module_subnet2"></a> [subnet2](#module\_subnet2) | terraform.registry.launch.nttdata.com/module_primitive/subnet/aws | ~> 1.0 |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform.registry.launch.nttdata.com/module_primitive/security_group/aws | ~> 0.2 |
| <a name="module_ingress_rule"></a> [ingress\_rule](#module\_ingress\_rule) | terraform.registry.launch.nttdata.com/module_primitive/vpc_security_group_ingress_rule/aws | ~> 0.1 |
| <a name="module_egress_rule"></a> [egress\_rule](#module\_egress\_rule) | terraform.registry.launch.nttdata.com/module_primitive/vpc_security_group_egress_rule/aws | ~> 0.1 |
| <a name="module_ecs_task"></a> [ecs\_task](#module\_ecs\_task) | terraform.registry.launch.nttdata.com/module_collection/ecs_task/aws | ~> 1.0 |
| <a name="module_ecs_service"></a> [ecs\_service](#module\_ecs\_service) | ../../ | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name for the ECS service | `string` | n/a | yes |
| <a name="input_desired_count"></a> [desired\_count](#input\_desired\_count) | The number of instances of the task definition to place and keep running | `number` | `1` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability zone for the subnet | `string` | `"us-east-2a"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | CIDR block for the VPC | `string` | `"10.0.0.0/16"` | no |
| <a name="input_subnet1_cidr_block"></a> [subnet1\_cidr\_block](#input\_subnet1\_cidr\_block) | CIDR block for subnet1 | `string` | `"10.0.1.0/24"` | no |
| <a name="input_subnet2_cidr_block"></a> [subnet2\_cidr\_block](#input\_subnet2\_cidr\_block) | CIDR block for subnet2 | `string` | `"10.0.2.0/24"` | no |
| <a name="input_subnet2_availability_zone"></a> [subnet2\_availability\_zone](#input\_subnet2\_availability\_zone) | Availability zone for subnet2 | `string` | `"us-east-2b"` | no |
| <a name="input_security_group_name_prefix"></a> [security\_group\_name\_prefix](#input\_security\_group\_name\_prefix) | Name prefix for the security group | `string` | `"ecs-service-sg-"` | no |
| <a name="input_ingress_ip_protocol"></a> [ingress\_ip\_protocol](#input\_ingress\_ip\_protocol) | IP protocol for ingress rule | `string` | `"tcp"` | no |
| <a name="input_ingress_from_port"></a> [ingress\_from\_port](#input\_ingress\_from\_port) | From port for ingress rule | `number` | `80` | no |
| <a name="input_ingress_to_port"></a> [ingress\_to\_port](#input\_ingress\_to\_port) | To port for ingress rule | `number` | `80` | no |
| <a name="input_ingress_cidr_ipv4"></a> [ingress\_cidr\_ipv4](#input\_ingress\_cidr\_ipv4) | CIDR IPv4 for ingress rule | `string` | `"0.0.0.0/0"` | no |
| <a name="input_egress_ip_protocol"></a> [egress\_ip\_protocol](#input\_egress\_ip\_protocol) | IP protocol for egress rule | `string` | `"-1"` | no |
| <a name="input_egress_from_port"></a> [egress\_from\_port](#input\_egress\_from\_port) | From port for egress rule | `number` | `0` | no |
| <a name="input_egress_to_port"></a> [egress\_to\_port](#input\_egress\_to\_port) | To port for egress rule | `number` | `0` | no |
| <a name="input_egress_cidr_ipv4"></a> [egress\_cidr\_ipv4](#input\_egress\_cidr\_ipv4) | CIDR IPv4 for egress rule | `string` | `"0.0.0.0/0"` | no |
| <a name="input_ecs_cluster_name"></a> [ecs\_cluster\_name](#input\_ecs\_cluster\_name) | Name for the ECS cluster | `string` | `"my-cluster"` | no |
| <a name="input_ecs_task_family"></a> [ecs\_task\_family](#input\_ecs\_task\_family) | Family name for the ECS task definition | `string` | `"my-task-definition"` | no |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Name for the container in the ECS task definition | `string` | `"nginx"` | no |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | Container image for the ECS task | `string` | `"nginx:latest"` | no |
| <a name="input_assign_public_ip"></a> [assign\_public\_ip](#input\_assign\_public\_ip) | Whether to assign public IP to tasks | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
| <a name="output_subnet_ids"></a> [subnet\_ids](#output\_subnet\_ids) | The IDs of the subnets |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group |
| <a name="output_ecs_cluster_name"></a> [ecs\_cluster\_name](#output\_ecs\_cluster\_name) | The name of the ECS cluster |
| <a name="output_ecs_service_id"></a> [ecs\_service\_id](#output\_ecs\_service\_id) | The ID of the ECS service |
| <a name="output_ecs_service_name"></a> [ecs\_service\_name](#output\_ecs\_service\_name) | The name of the ECS service |
| <a name="output_ecs_service_cluster"></a> [ecs\_service\_cluster](#output\_ecs\_service\_cluster) | The cluster the ECS service is associated with |
| <a name="output_ecs_service_desired_count"></a> [ecs\_service\_desired\_count](#output\_ecs\_service\_desired\_count) | The desired number of tasks for the ECS service |
| <a name="output_ecs_service_task_definition"></a> [ecs\_service\_task\_definition](#output\_ecs\_service\_task\_definition) | The task definition ARN used by the ECS service |
| <a name="output_ecs_service_launch_type"></a> [ecs\_service\_launch\_type](#output\_ecs\_service\_launch\_type) | The launch type of the ECS service |
<!-- END_TF_DOCS -->
