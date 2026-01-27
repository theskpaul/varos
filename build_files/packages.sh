#!/bin/bash

set -ouex pipefail

### Install packages
# dnf5 config-manager setopt terra.enabled=1
# dnf5 config-manager setopt rpmfusion-free.enabled=1
# dnf5 config-manager setopt rpmfusion-nonfree.enabled=1

dnf5 remove -y libva-intel-media-driver

PACKAGES="alacritty \
          bat \
          distrobox \
          clang \
          neovim \
          gparted \
          thefuck \
          podman-compose \
          godot \
          zsh \
          zed \
          git \
          toolbox \
          zsh-autosuggestions \
          zsh-syntax-highlighting \
          gh \
          code \
          fuse-btrfs \
          android-tools \
          android-file-transfer \
          google-android-emoji-fonts \
          memtest86+ \
          smartmontools \
          plasma-firewall \
          ksystemlog \
          kclock
          kcalc \
          okular \
          gwenview \
          persepolis \
          clamav \
          clamtk \
          btop \
          intel-gpu-tools \
          intel-media-driver \
          terminus-fonts-console \
          docker \
          docker-cli \
          containerd \
          docker-buildx \
          docker-compose \
          docker-compose-switch \
          virt-manager \
          qemu \
          steam \
          lutris"

dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
                https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 install -y --nogpgcheck --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' terra-release
dnf5 install -y $PACKAGES --skip-unavailable

# dnf5 config-manager setopt terra.enabled=0
# dnf5 config-manager setopt terra.enabled=0
# dnf5 config-manager setopt rpmfusion-free.enabled=0
# dnf5 config-manager setopt rpmfusion-free-updates.enabled=0
# dnf5 config-manager setopt rpmfusion-nonfree.enabled=0
# dnf5 config-manager setopt rpmfusion-nonfree-updates.enabled=0
