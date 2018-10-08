output "ELB-DNS" {
  value = "${aws_elb.WordPresselb.dns_name}"
}