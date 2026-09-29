# DevSecOps approach

Security is integrated into the infrastructure delivery process instead of being added only after deployment.

## CI controls

The GitHub Actions workflow performs:

1. source checkout
2. Terraform setup
3. `terraform fmt -check`
4. `terraform init -backend=false`
5. `terraform validate`
6. Trivy Infrastructure-as-Code scan

A pull request can therefore be blocked when configuration quality or high/critical IaC security checks fail.

## Secrets

The repository must never contain:

- Azure client secrets
- private SSH keys
- `.tfvars` with real values
- Terraform state
- passwords
- access tokens

For non-interactive Azure authentication, prefer federated identity / OIDC or another organization-approved mechanism.

## Security architecture

The Terraform design demonstrates:

- CIDR-restricted SSH
- managed identity
- RBAC-enabled Key Vault
- password authentication disabled
- non-public blob container
- storage TLS controls
- centralized audit logs for Key Vault

## Enterprise controls I would add

- Azure Policy
- Defender for Cloud
- private endpoints
- centralized secret rotation
- branch protection / required review
- signed artifacts where appropriate
- SAST / dependency scanning for application workloads
- policy-as-code gates
- environment-specific approvals
