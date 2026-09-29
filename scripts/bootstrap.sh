#!/usr/bin/env bash
set -euo pipefail

echo "Azure Platform Engineering Lab - bootstrap validation"

for command in terraform az git; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "Missing dependency: $command"
    exit 1
  fi
done

echo "Terraform:"
terraform version | head -n 1

echo "Azure CLI:"
az version --output tsv 2>/dev/null | head -n 1 || true

echo "Git:"
git --version

echo "Dependencies available."
