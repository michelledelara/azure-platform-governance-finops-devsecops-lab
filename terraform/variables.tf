variable "project_name" {
  description = "Short project identifier used in Azure resource names."
  type        = string
  default     = "az-platform-lab"
}

variable "location" {
  description = "Azure region for the lab."
  type        = string
  default     = "Brazil South"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "lab"

  validation {
    condition     = contains(["lab", "dev", "test", "prod"], var.environment)
    error_message = "environment must be one of: lab, dev, test, prod."
  }
}

variable "owner" {
  description = "Logical owner tag."
  type        = string
  default     = "Michelle de Lara Ferraz Silveira Almeida"
}

variable "cost_center" {
  description = "Cost allocation tag."
  type        = string
  default     = "portfolio-cloud"
}

variable "admin_username" {
  description = "Linux administrator username."
  type        = string
  default     = "azureadmin"
}

variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM."
  type        = string
  sensitive   = true
}

variable "admin_cidr" {
  description = "CIDR allowed to access SSH. Use your current public IP/32, never 0.0.0.0/0 for a real deployment."
  type        = string
}

variable "vm_size" {
  description = "Azure VM size. Small default supports FinOps-oriented lab usage."
  type        = string
  default     = "Standard_B1s"
}

variable "enable_budget" {
  description = "Create a subscription-level budget guardrail."
  type        = bool
  default     = false
}

variable "monthly_budget_amount" {
  description = "Monthly budget amount in the subscription billing currency."
  type        = number
  default     = 50
}

variable "budget_contact_emails" {
  description = "Email recipients for Azure budget notifications."
  type        = list(string)
  default     = []
}
