
module "EC2" {
  source = "Modules/EC2"
  subnet-id = "${var.subnet-id}"
  sg-inst = "${var.sg-inst}"
  key-pair = "${var.key-pair}"
}

module "ELB" {
  source = "Modules/ELB"
  subnet-id = "${var.subnet-id}"
  sg-elb = "${var.sg-elb}"
  instance_id = "${module.EC2.instance_id}"
}

module "RDS" {
  source = "Modules/RDS"
  wp-vpc-id = "${var.wp-vpc-id}"
  wp-private-id1 = "${var.wp-private-id1}"
  wp-private-id2 = "${var.wp-private-id2}"
  password = "${var.password}"
  sg-rds = "${var.sg-rds}"
}