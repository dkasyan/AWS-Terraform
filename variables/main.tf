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
  default = [ 80,443 ]
}

variable "egress" {
  type = list(number)
  default = [ 80,443 ]
  
}