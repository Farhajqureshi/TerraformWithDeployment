variable "region" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "ami" {}
variable "instance_type" {}
variable "key_name" {}
variable "app_port" {
  default = 8080
}
