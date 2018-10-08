provider "aws" {
  region = "us-east-1"
}

locals {
  instance_prefix = "${aws_instance.WordPress-Blog.id}"
}

data "template_file" "user_data" {
  template = "${file("Modules/EC2/userdata.sh")}"
}

data "aws_security_group" "sg-instance" {
  id = "${var.sg-inst}"
}
resource "aws_instance" "WordPress-Blog" {
  ami = "${var.instance_id}"
  instance_type = "t2.micro"
  key_name = "${var.key-pair}"
  associate_public_ip_address = "true"
  subnet_id = "${var.subnet-id}"
  vpc_security_group_ids = ["${data.aws_security_group.sg-instance.id}"]
  user_data = "${data.template_file.user_data.rendered}"
  tags {
    Name = "WordPressBlog-Gova"
  }
}


