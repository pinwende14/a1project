resource "aws_db_subnet_group" "pinare_subnet_group" {
  name = "pinare-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_rds_cluster_parameter_group" "pinare_cluster_parameter_group" {
  name        = "pinare-cluster-parameter-group"
  family      = "aurora-postgresql11"
  description = "Cluster parameter group"
}

resource "aws_rds_cluster" "aurora-cluster" {
  cluster_identifier              = "pinare-aurora-postgres-cluster"
  engine                          = "aurora-postgresql"
  engine_version                  = "11.9"
  database_name                   = "pinare_database"
  master_username                 = "successpinare"
  master_password                 = var.master_password
  db_subnet_group_name            = aws_db_subnet_group.pinare_subnet_group.name
  vpc_security_group_ids          = [var.security_group_id]
  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.pinare_cluster_parameter_group.name
  skip_final_snapshot             = true # Set to false if you want to take a final snapshot when deleting the cluster

  storage_encrypted       = true
  backup_retention_period = 9
  preferred_backup_window = "09:00-11:00"
  deletion_protection     = false
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = {
    Name = "pinare-aurora-postgres-cluster"
  }
}

resource "aws_rds_cluster_instance" "pinare_cluster_instances" {
  count = length(var.subnet_ids)
  cluster_identifier   = aws_rds_cluster.aurora-cluster.id
  instance_class       = "db.r5.large"
  engine               = "aurora-postgresql"
  engine_version       = "11.9"
  publicly_accessible  = true
  db_subnet_group_name = aws_db_subnet_group.pinare_subnet_group.name
  identifier           = "pinare-${count.index + 1}"
  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
  tags = merge(var.common_tags, {
    Name = format("%s-pinare_cluster_instances-${count.index}", var.common_tags["project"])
    },
  )
}
