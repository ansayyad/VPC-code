# CIDRs for database subnets azs
variable "database_subnet_azs" {
  type = "list"
}


# CIDRs for database subnets cidrs
variable "database_subnet_cidrs" {
  type = "list"
}

variable "vpc_id" {
  type = "string"
}

variable "route_out" {
  type = "string"
}

variable "nat_gw_id" {
  type = "list"
}