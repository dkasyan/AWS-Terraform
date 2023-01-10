variable "cloud_name" {
    type = string
}

variable "bucket_name" {
  type        = string
  description = "The name of the bucket without the www. prefix. Normally domain_name."
}

variable "common_tags" {
  description = "Common tags you want applied to all components."
}

variable "vpc_name" {
  type = string
  description = "Common tags you want applied to all components."
}

variable "vpcname" {
  type = string
  default = "myvpc"

}
variable "sshport" {
    type = number
    default = 22  
}

variable "ingress" {
  type = list(number)
  default = [ 80,443,22 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443,22,25,3306,53,8080 ]
}

#variable "security_group" {
  
#}

#variable "hosted_zone_A" {
#  type = string
#  default = "eu-west-1a"
#}
