
variable "rgs" {
  description = "Resource group configuration"
  type        = map(any)
}

variable "vnet" {
  description = "Virtual network configuration"
  type        = map(any)
}

variable "subnet" {
  description = "Subnet configuration"
  type        = map(any)
}

variable "nsg" {
  description = "Network security group configuration"
  type        = map(any)
}

variable "public_ip" {
  description = "Public IP configuration"
  type        = map(any)
}

variable "virtual_machine" {
  description = "Virtual machine configuration"
  type        = map(any)
}

variable "nic" {
  description = "Network interface configuration"
  type        = map(any)
}