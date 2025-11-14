variable "ec2_instance_type" {
    default = "t3.micro"
    type = string
}

variable "ami_id" {
  default = "ami-0cfde0ea8edd312d4"
}

variable "root_default_storage_size" {
  default = 10
  type = number
}

variable "evn" {
  default = "production"
  type = string
}