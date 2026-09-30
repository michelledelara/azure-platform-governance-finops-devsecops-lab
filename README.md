# Azure Platform Engineering & Governance Lab

Completed portfolio reference implementation focused on Microsoft Azure Platform Engineering.

This project demonstrates how I structure an Azure environment using **Terraform**, combining **networking, Linux, security, observability, DevSecOps, FinOps and AI-ready architecture** in a version-controlled infrastructure workflow.

> **Scope note:** this repository is a hands-on reference implementation for portfolio and technical demonstration. It does not claim production ownership of a corporate Azure environment. The infrastructure can be deployed to an authorized Azure subscription and destroyed after validation to control cost.
>
> **FinOps note:** the environment was provisioned for validation and then destroyed to avoid unnecessary cloud consumption and preserve student credits.

## What this project demonstrates

- Infrastructure as Code with Terraform
- Azure Resource Group organization
- VNet and subnet design
- Network Security Group controls
- Linux VM provisioning
- Azure Storage
- Azure Key Vault
- Managed Identity
- Log Analytics / Azure Monitor foundation
- Tagging and cost-allocation strategy
- Optional subscription budget guardrail
- CI validation with GitHub Actions
- DevSecOps scanning for Terraform
- Operational health checks
- Troubleshooting documentation
- AI workload readiness considerations

## Engineering principles

1. **Automation over manual provisioning**
2. **Security integrated into the delivery lifecycle**
3. **Cost governance as an architecture concern**
4. **Observability from the beginning**
5. **Least privilege and traceability**
6. **Reusable, version-controlled infrastructure**

## Architecture

```text
                         GitHub
                           |
                    GitHub Actions
                           |
          fmt -> validate -> security scan
                           |
                       Terraform
                           |
                          Azure
                           |
        +------------------+-------------------+
        |                  |                   |
   Resource Group        VNet              Governance
        |                  |                   |
        |               Subnet            Tags / Budget
        |                  |
        |              NSG controls
        |                  |
        +---------+--------+---------+
                  |                  |
              Linux VM          Storage Account
                  |                  |
           Managed Identity      Data foundation
                  |
              Key Vault
                  |
          Log Analytics / Monitor

AI-ready design:
Identity + secure storage + network controls + observability + cost governance
```

See [`docs/architecture.md`](docs/architecture.md) for the detailed design.

## Repository structure

```text
.
├── README.md
├── LICENSE
├── .gitignore
├── docs/
│   ├── architecture.md
│   ├── ai-readiness.md
│   ├── devsecops.md
│   ├── finops.md
│   └── troubleshooting.md
├── scripts/
│   ├── bootstrap.sh
│   └── health-check.sh
├── terraform/
│   ├── versions.tf
│   ├── providers.tf
│   ├── variables.tf
│   ├── locals.tf
│   ├── main.tf
│   ├── network.tf
│   ├── security.tf
│   ├── compute.tf
│   ├── storage.tf
│   ├── monitoring.tf
│   ├── finops.tf
│   ├── outputs.tf
│   └── terraform.tfvars.example
└── .github/
    └── workflows/
        └── terraform-ci.yml
```

## Technology stack

- Microsoft Azure
- Terraform
- Linux
- Azure VNet / Subnet / NSG
- Azure Virtual Machines
- Azure Storage
- Azure Key Vault
- Azure Monitor / Log Analytics
- Managed Identity
- Git / GitHub
- GitHub Actions
- Trivy IaC scanning
- Bash

## Terraform workflow

```bash
cd terraform

terraform init
terraform fmt -check
terraform validate
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

For a portfolio lab, destroy resources after validation when they are no longer needed:

```bash
terraform destroy -var-file="terraform.tfvars"
```

## Local authentication

For local execution, authenticate with Azure CLI:

```bash
az login
az account show
```

Then run Terraform from the `terraform/` directory.

For CI/CD, prefer workload identity / OIDC or another approved non-interactive identity mechanism rather than embedding credentials in code.

## DevSecOps

The GitHub Actions workflow performs:

- Terraform formatting validation
- Terraform initialization
- Terraform validation
- Infrastructure-as-Code security scanning with Trivy
- Artifact-free validation that does not expose secrets

See [`docs/devsecops.md`](docs/devsecops.md).

## FinOps

FinOps controls demonstrated in this project include:

- mandatory governance tags
- cost-center / environment / owner metadata
- small default VM sizing for lab use
- Standard LRS storage
- optional subscription budget resource
- documented rightsizing process
- idle-resource review
- storage lifecycle considerations
- explicit destroy procedure for temporary environments

See [`docs/finops.md`](docs/finops.md).

## AI readiness

The lab does not pretend to be a production AI platform. Instead, it demonstrates the platform foundations I would require before onboarding AI workloads:

- controlled identity
- secure secret management
- governed data storage
- network segmentation
- centralized observability
- cost allocation
- policy-ready tagging
- scalable architecture patterns

See [`docs/ai-readiness.md`](docs/ai-readiness.md).

## Security considerations

- SSH access is restricted to a configurable CIDR
- Key Vault uses RBAC authorization
- VM uses a system-assigned managed identity
- Storage public access is disabled
- TLS 1.2 is enforced for storage
- Infrastructure changes are version-controlled
- secrets and `.tfvars` files are excluded from Git

## Operational approach

The project includes a health-check script and a troubleshooting guide covering:

- Terraform drift
- VM connectivity
- NSG rules
- state issues
- authentication failures
- unexpected cloud cost
- monitoring gaps

## Status

**Completed — Portfolio Reference Implementation**

## Author

**Michelle de Lara Ferraz Silveira Almeida**

Cloud Computing | Platform Engineering | Governance | Security | GRC
