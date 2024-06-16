#!/bin/bash
# Fedora 40 Setup Script

echo "Starting Fedora 40 setup..."

# Update the system
echo "Updating system..."
sudo dnf update -y

# Install essential software
echo "Installing essential software..."
sudo dnf install -y vim git curl wget htop gnome-tweaks

# Enable RPM Fusion repositories
echo "Enabling RPM Fusion repositories..."
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install multimedia codecs
echo "Installing multimedia codecs..."
sudo dnf groupupdate -y multimedia --setop="install_weak_deps=False" \
  && sudo dnf groupupdate -y sound-and-video

# Install Flatpak and add Flathub repository
echo "Installing Flatpak and adding Flathub repository..."
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install GNOME Extensions app
echo "Installing GNOME Extensions app..."
sudo dnf install -y gnome-shell-extension-prefs

# Set up the firewall
echo "Setting up the firewall..."
sudo systemctl enable --now firewalld
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload

# Clean up
echo "Cleaning up..."
sudo dnf autoremove -y
sudo dnf clean all

echo "Fedora 40 setup complete! Please restart your computer to apply all changes."

# Save and Exit: Save the file and exit the text editor (in nano, you can do this by pressing Ctrl+X, then Y to confirm, and Enter to save).

# Make the Script Executable: Change the permissions of the script to make it executable.

# chmod +x fedora_setup.sh

# Run the Script: Execute the script to perform the setup tasks.

# ./fedora_setup.sh
