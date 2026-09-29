# FinOps approach

FinOps is treated as an engineering discipline, not as a post-deployment cost-cutting exercise.

## Controls implemented

### Cost allocation tags
The Terraform configuration applies common tags:

- Project
- Environment
- Owner
- CostCenter
- ManagedBy
- Repository
- WorkloadClass

These tags support cost attribution and operational ownership.

### Deliberate resource sizing
The default VM size is intentionally small for a lab. In a real workload, sizing should be based on measured CPU, memory, storage and network utilization rather than assumptions.

### Storage choice
The default Storage Account uses Standard LRS, appropriate for a low-cost reference implementation. Production replication must be selected according to durability, availability and regulatory requirements.

### Budget
An optional `azurerm_consumption_budget_subscription` resource can create forecasted and actual spend notifications.

### Temporary-environment lifecycle
The README explicitly documents `terraform destroy` so temporary lab resources are not left running.

## FinOps review loop

1. Allocate cost with tags.
2. Measure actual usage.
3. Identify idle and oversized resources.
4. Rightsize based on telemetry.
5. Review storage tiers and retention.
6. Validate reliability impact.
7. Implement through IaC.
8. Measure again.

## Principle

The cheapest resource is not automatically the optimal resource.

Platform decisions should consider TCO, performance, availability, security and operational effort.
