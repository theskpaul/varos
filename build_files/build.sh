#!/bin/bash

set -ouex pipefail

### Install packages
dnf5 config-manager setopt terra.enabled=1

dnf5 install -y "https://repo.protonvpn.com/fedora-$(cat /etc/fedora-release | cut -d' ' -f 3)-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.3-1.noarch.rpm"
dnf5 install -y proton-vpn-gnome-desktop --skip-broken --skip-unavailable
dnf5 install -y alacritty bat clang neovim docker-cli containerd docker-buildx docker-compose docker-compose-switch thefuck podman-compose godot mono-devel zsh zed git toolbox zsh-autosuggestions zsh-syntax-highlighting gh code btop --skip-unavailable

#### Example for enabling a System Unit File

systemctl enable podman.socket
