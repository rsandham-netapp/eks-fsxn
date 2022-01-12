resource "aws_fsx_ontap_file_system" "eksfs" {
  storage_capacity    = 2048
  subnet_ids          = module.vpc.private_subnets
  deployment_type     = "MULTI_AZ_1"
  throughput_capacity = 512
  preferred_subnet_id = module.vpc.private_subnets[0]
  security_group_ids = [aws_security_group.fsxn_sg.id]
  fsx_admin_password = var.fsx_admin_password
  route_table_ids = module.vpc.private_route_table_ids
  tags = {
      Name = var.fsxname
  }
}

resource "aws_fsx_ontap_storage_virtual_machine" "ekssvm" {
  file_system_id = aws_fsx_ontap_file_system.eksfs.id
  name           = "ekssvm"
}

resource "aws_security_group" "fsxn_sg" {
  name_prefix = "security group for fsx access"
  vpc_id      = module.vpc.vpc_id
  tags = {
      Name = "fsxn_sg"
  }
}

resource "aws_security_group_rule" "fsxn_sg_inbound" {
  description       = "allow inbound traffic to eks"
  from_port         = 0
  protocol          = "-1"
  to_port           = 0
  security_group_id = aws_security_group.fsxn_sg.id
  type              = "ingress"
  cidr_blocks       = [var.vpc_cidr]
}

resource "aws_security_group_rule" "fsxn_sg_outbound" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.fsxn_sg.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}
