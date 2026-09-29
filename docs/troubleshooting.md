# Troubleshooting playbook

## 1. Terraform reports unexpected changes

### Check
```bash
terraform plan
```

### Investigate
- manual Azure Portal changes
- state mismatch
- resource replacement caused by an immutable property
- changed variables

### Principle
Do not blindly apply a plan that destroys or replaces critical resources. Understand why the diff exists first.

---

## 2. VM is running but SSH fails

Check in this order:

1. VM power state
2. public IP
3. NIC association
4. route
5. NSG rule
6. source administrator CIDR
7. TCP/22
8. username / SSH key
9. `sshd` service

---

## 3. HTTP health check fails

Check:

```bash
systemctl status nginx
ss -tulpn
curl http://localhost
```

Then review network controls and the public IP.

---

## 4. Terraform authentication fails

Check:

```bash
az account show
az account list --output table
```

Confirm the expected subscription and permissions.

---

## 5. Cloud cost is higher than expected

Review:

- running VM hours
- VM size
- unattached disks / public IPs
- storage volume and redundancy
- Log Analytics ingestion
- temporary resources not destroyed
- tags and cost allocation

Then rightsizing decisions should be applied through Terraform rather than undocumented manual changes.

---

## 6. Security scan fails

Read the IaC finding before suppressing it.

Preferred order:

1. fix the configuration
2. document the rationale if it is an accepted design exception
3. use a narrowly-scoped suppression only when justified
