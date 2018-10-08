provider "aws" {
  region = "us-east-1"
}

data "aws_security_group" "sg-elb" {
  id = "${var.sg-elb}"
}

resource "aws_elb" "WordPresselb" {
  subnets = ["${var.subnet-id}"]
  security_groups = ["${data.aws_security_group.sg-elb.id}"]
  "listener" {
    instance_port = 80
    instance_protocol = "tcp"
    lb_port = 80
    lb_protocol = "tcp"
  }
  health_check {
    healthy_threshold = "2"
    interval = "5"
    target = "HTTP:80/healthy.html"
    timeout = "4"
    unhealthy_threshold = "3"
  }
}

resource "aws_elb_attachment" "WordPress-instance" {
  elb = "${aws_elb.WordPresselb.id}"
  instance = "${var.instance_id}"
}