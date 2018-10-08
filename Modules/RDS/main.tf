provider "aws" {
  region = "us-east-1"
}

data "aws_security_group" "rds-sg" {
  id = "${var.sg-rds}"
}

resource "aws_db_instance" "Database" {
  allocated_storage = "${var.storage}"
  instance_class = "${var.instanceclass}"
  engine = "${var.engine}"
  engine_version = "${var.engine_version}"
  name = "${var.db_name}"
  username = "${var.username}"
  password = "${var.password}"
  vpc_security_group_ids = ["${data.aws_security_group.rds-sg.id}"]
  db_subnet_group_name = "${aws_db_subnet_group.WordPress-group.id}"
  final_snapshot_identifier = "true"
  skip_final_snapshot = "true"
}

resource "aws_db_subnet_group" "WordPress-group" {
  name = "wordpress-db-subnet-group"
  subnet_ids = ["${var.wp-private-id1}","${var.wp-private-id2}"]
}