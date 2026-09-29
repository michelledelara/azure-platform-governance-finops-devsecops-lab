# Architecture

## Goal

Create a compact Azure platform reference implementation that demonstrates the foundations expected in a Platform Engineering environment without pretending to reproduce a full enterprise landing zone.

## Components

### Resource organization
A dedicated Resource Group isolates the lab and makes lifecycle and cost management straightforward.

### Networking
The platform uses:

- one Azure VNet
- one workload subnet
- one NSG
- one Standard Public IP
- one NIC

SSH is restricted to an explicit administrator CIDR. A real enterprise implementation would typically prefer private administrative access, Bastion, VPN or another approved access path.

### Compute
A small Ubuntu Linux VM demonstrates:

- Terraform provisioning
- Linux bootstrap with cloud-init
- managed identity
- network attachment
- health validation

### Security
The project includes:

- NSG rules
- Key Vault
- RBAC-based Key Vault authorization
- system-assigned managed identity
- no password authentication on the VM
- private blob container
- TLS 1.2 minimum on storage

### Data
Azure Storage represents a governed data foundation. The design disables anonymous blob exposure and enables soft-delete/versioning features.

### Observability
A Log Analytics workspace centralizes platform telemetry. The reference implementation attaches diagnostic settings to Key Vault audit logs and metrics.

### FinOps
All supported resources receive common tags for:

- environment
- owner
- cost center
- workload
- management method

The project also contains an optional subscription budget resource.

### AI-ready foundation
This lab does not claim to deploy an AI model. Instead, it shows the infrastructure prerequisites that should exist before an AI service is onboarded:

- identity
- secure storage
- network controls
- observability
- cost allocation
- secret management
- auditability

## Enterprise evolution

In a larger environment I would extend this pattern with:

- remote Terraform state and locking
- hub-and-spoke networking
- private endpoints
- Azure Firewall
- Azure Policy
- Azure Bastion
- centralized DNS
- multiple subscriptions
- landing-zone management groups
- workload identity federation
- AKS
- Defender for Cloud
- full diagnostic coverage
- reusable Terraform modules
