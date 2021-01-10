#!/bin/bash
set -e
# https://wiki.archlinux.org/index.php/Pacman/Package_signing#Adding_unofficial_keys

echo "Receiving Key for SMD-Linux Packages"
sudo pacman-key --recv-keys BB31837564255477
echo "Verify Fingerprint"
sudo pacman-key --finger BB31837564255477
echo "Local Sign Imported Key"
sudo pacman-key --lsign-key BB31837564255477
echo "Refresh Keys"
sudo pacman-key --refresh-keys

echo "~~~~~~~~~~~~~~~"
echo "|             |"
echo "|  key added  |"
echo "|             |"
echo "~~~~~~~~~~~~~~~"
