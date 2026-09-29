#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <public-ip>"
  exit 1
fi

TARGET_IP="$1"

echo "Checking network reachability to ${TARGET_IP}..."
curl --connect-timeout 10 --fail "http://${TARGET_IP}" || {
  echo
  echo "Health check failed."
  echo "Review VM state, NSG rules, NIC, public IP and nginx service."
  exit 1
}

echo
echo "Health check passed."
