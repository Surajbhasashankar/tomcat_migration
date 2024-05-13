resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wtyreports-vpc.id

  tags = {
    Name = "igw"
  }
}
