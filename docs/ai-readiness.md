# AI workload readiness

## Why AI belongs in a Platform Engineering discussion

AI workloads amplify existing platform requirements:

- compute can become expensive quickly
- data access must be governed
- model and data artifacts require controlled storage
- identities need least privilege
- observability must include workload and cost signals
- security and compliance controls must be traceable

## Foundation demonstrated by this lab

### Identity
The Linux workload uses managed identity rather than embedded credentials.

### Secrets
Key Vault provides the secret-management foundation.

### Data
Azure Storage provides a controlled data plane for future artifacts or datasets.

### Network
VNet, subnet and NSG controls create an explicit network boundary.

### Observability
Log Analytics provides a centralized telemetry destination.

### FinOps
Tags and budgets establish allocation and guardrails before AI compute is introduced.

## AI platform extension

For an enterprise AI implementation, the next architecture layer could include services such as:

- Azure AI Foundry / Azure AI services
- Azure Machine Learning
- GPU-enabled compute where justified
- private endpoints
- model registry
- approved data sources
- model / prompt evaluation
- Responsible AI controls
- AI-specific monitoring

These are architectural extensions, not resources claimed as deployed by this reference implementation.

## Governance questions before onboarding an AI workload

1. Who owns the workload?
2. Which data can it access?
3. What is the classification of that data?
4. Which identity is used?
5. What network path is allowed?
6. What is the expected cost envelope?
7. What telemetry is required?
8. What security and compliance policies apply?
9. What is the rollback / disable procedure?
