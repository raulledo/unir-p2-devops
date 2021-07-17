variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D2_v3" # 8GB, 2CPUs, 50 GB, €122,5062/mes (disponible westeurope)
}

variable "vm_names" {
  type = list(string)
  description = "Maquinas virtuales a crear"
  default = ["Master","Worker"]
}

