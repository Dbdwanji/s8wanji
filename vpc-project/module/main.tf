module "vpc" {
  source = "./vpc-module"

  vpc_cidr                = "10.0.0.0/16"
  vpc_name                = "MyVPC"
  igw_name                = "MyIGW"
  public_route_table_name = "PublicRT"
  private_route_table_name = "PrivateRT"
  nat_eip_name            = "MyNatEIP"
  nat_gateway_name        = "MyNatGW"
  nat_gateway_subnet      = "PublicSubnet1"

  public_subnets = {
    "PublicSubnet1" = { cidr = "10.0.1.0/24", az = "us-east-1a" }
    "PublicSubnet2" = { cidr = "10.0.2.0/24", az = "us-east-1b" }
    "PublicSubnet3" = { cidr = "10.0.3.0/24", az = "us-east-1c" }
  }

  private_subnets = {
    "PrivateSubnet1" = { cidr = "10.0.4.0/24", az = "us-east-1d" }
    "PrivateSubnet2" = { cidr = "10.0.5.0/24", az = "us-east-1e" }
    "PrivateSubnet3" = { cidr = "10.0.6.0/24", az = "us-east-1f" }
  }
}
