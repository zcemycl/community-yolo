variable "aws_region" {
  default = "eu-west-2"
  type    = string
}

variable "availability_zones" {
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "base_cidr_block" {
  default = "10.1.0.0/16"
}

variable "vpc_r53_resolver_ip" {
  description = "vpc cidr +2 is the vpc route 53 resolver ip"
  default     = "10.1.0.2"
}

variable "vpn_cidr_block" {
  default = "10.1.144.0/22"
}

variable "public_subnets_cidr" {
  default = ["10.1.0.0/21", "10.1.8.0/21"]
}

variable "private_subnets_cidr" {
  default = ["10.1.24.0/21", "10.1.32.0/21"]
}

variable "server_crt_path" {
  default = "~/my-vpn-files/server.crt"
}

variable "server_key_path" {
  default = "~/my-vpn-files/server.key"
}

variable "ca_cert_path" {
  default = "~/my-vpn-files/ca.crt"
}

variable "client_crt_path" {
  default = "~/my-vpn-files/client1.domain.tld.crt"
}

variable "client_key_path" {
  default = "~/my-vpn-files/client1.domain.tld.key"
}
