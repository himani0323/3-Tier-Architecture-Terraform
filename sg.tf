module "my-sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "ec2-service"
  description = "Security group for user-service with custom ports open within VPC"
  vpc_id      = module.vpc.vpc_id

  egress_cidr_blocks      = ["0.0.0.0/0"]
  egress_rules            = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
}
