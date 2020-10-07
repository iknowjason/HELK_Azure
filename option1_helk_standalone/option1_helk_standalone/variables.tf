### 
### Declare variable for IP address prefix for white listing Azure NSG
###
variable "src_ip" {
  type = string
  default = "*"
}
