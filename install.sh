#!/bin/bash

set -eo pipefail

sudo apt update && sudo apt install -qqy curl vim jq bridge-utils

sudo rm -f /var/log/cni.log || true
sudo rm -f /tmp/last_allocated_ip || true
sudo cp my-cni-demo /opt/cni/bin/
sudo cp 10-my-cni-demo.conf /etc/cni/net.d/
