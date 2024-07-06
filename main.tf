resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}
resource "aws_iam_user" "iamusr1" {
  name = var.iam
  path = "/system/"
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
}
resource "aws_subnet" "sbnet1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "sbnet1"
  }
}
