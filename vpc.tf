resource "aws_vpc" "wtyreports-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "wtyreports-vpc"
  }
}
