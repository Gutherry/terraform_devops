resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 1) # 10.0.1.0/24
  availability_zone       = "${data.aws_region.current.name}a"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "Devops subenet 1a",
    "kubernetes.io/role/elb"    = 1
    "kubernetes.io/cluster/eks" = "owned"
  }
}

resource "aws_subnet" "eks_subnet_public_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = cidrsubnet(var.cidr_block, 8, 2)
  availability_zone       = "${data.aws_region.current.name}b"
  map_public_ip_on_launch = true

  tags = {
    Name                        = "Devops subenet 1b",
    "kubernetes.io/role/elb"    = 1
    "kubernetes.io/cluster/eks" = "owned"
    Owner                       = "Gutherry Ferreira"
    Environment                 = "Production"
    Department                  = "IT"
    Project                     = "Migration"
  }
}
