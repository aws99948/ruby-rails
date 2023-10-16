variable "docker_image_tag" {
  type = string
}

variable "ecr_repo_url" {
  type = string
}

variable "ecr_repo_name" {
  type = string
}

variable "number_of_instances" {
  type    = number
  default = 1
}

variable "ingress_rules" {
  type = list(object({
    protocol         = string
    from_port        = number
    to_port          = number
    cidr_blocks      = list(string)
    description      = string
    prefix_list_ids  = list(string)
    security_groups  = list(string)
    ipv6_cidr_blocks = list(string)
    self             = bool
  }))
}

