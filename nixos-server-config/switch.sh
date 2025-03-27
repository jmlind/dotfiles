#!/usr/bin/env bash
set -e

pushd /etc/nixos 

echo "Rebuilding NixOS configuration..."

# Build the system
sudo nixos-rebuild switch --flake .#homelab 

# as you were
popd

echo "Deployment complete!"
