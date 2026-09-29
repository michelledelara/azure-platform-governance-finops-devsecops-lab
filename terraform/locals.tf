locals {
  base_name = lower(replace(var.project_name, "_", "-"))

  common_tags = {
    Project       = var.project_name
    Environment   = var.environment
    Owner         = var.owner
    CostCenter    = var.cost_center
    ManagedBy     = "Terraform"
    Repository    = "azure-platform-governance-finops-devsecops-lab"
    WorkloadClass = "platform-ai-ready"
  }
}
