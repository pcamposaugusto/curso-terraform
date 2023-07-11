variable "location" {
  description = "Variable to indicate the name of the region where the resources will be created"
  type        = string
  default     = "Brazil South"
}

variable "account_tier" {
  description = "Camada de Conta de Armazenamento na Azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  # Aqui é para informar o tipo de replicação da conta de armazenamento da Azure
  description = "Tipo de replicação de dados da Storage Account"
  type        = string
  # Locally Redundant Storage
  default   = "LRS"
  sensitive = true
}