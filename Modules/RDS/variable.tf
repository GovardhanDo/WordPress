variable "storage" {
  default = "10"
}

variable "instanceclass" {
  default = "db.t2.micro"
}

variable "engine" {
  default = "mysql"
}

variable "engine_version" {
  default = "5.7.23"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "db_name" {
  default = "WordPress"
}

variable "username" {
  default = "Ebizoncloud"
}

variable "wp-vpc-id"{
}

variable "wp-private-id1" {
}

variable "wp-private-id2" {
}

variable "password" {
}

variable "sg-rds" {
}