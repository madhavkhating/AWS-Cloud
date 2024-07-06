resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
tags = {
Name =var.cloud
}
resource "aws_iam_user" "iamusr1" {
  name = var.iam
  path = "/system/"
tags = {
Name =var.cloud
}
}
resource "aws_instance" "myins1" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = var.instype
    tags = {
    Name = element(var.env, 2)
  }

}
resource "aws_s3_bucket" "mybkt" {
  bucket = var.bkt
tags = {
Name =var.cloud
}
}
resource "aws_subnet" "sbnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sbnet1"
  }
tags = {
Name =var.cloud
}
}
varibale "cloud" {
default = "cloud"
}
