#!/bin/bash

# Assumption: k8s/kubeadm was deployed using podcidr=10.240.0.0/16
# Allow pod to pod communication
iptables -A FORWARD -s 10.244.0.0/24 -j ACCEPT
iptables -A FORWARD -d 10.244.0.0/24 -j ACCEPT

# Allow communication across hosts
ip route add 10.244.1.0/24 via 192.168.49.2 dev eth0

# Allow outgoing internet 
iptables -t nat -A POSTROUTING -s 10.244.0.0/24 ! -o cni0 -j MASQUERADE

