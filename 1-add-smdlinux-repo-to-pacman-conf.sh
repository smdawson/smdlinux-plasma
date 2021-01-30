#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# 
# Edit by	:	Seth Dawson
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################


echo "################################################"
echo "###         Adding SMDLinux repo's          ####"
echo "################################################"

echo '
#[smdlinux_repo_testing]
#SigLevel = Required DatabaseOptional
#Server = https://repo.sethdawson.me/archlinux/$repo/$arch

[smdlinux_repo]
SigLevel = Required DatabaseOptional
Server = https://repo.sethdawson.me/archlinux/$repo/$arch

[smdlinux_repo_3party]
SigLevel = Required DatabaseOptional
Server = https://repo.sethdawson.me/archlinux/$repo/$arch
' | sudo tee --append /etc/pacman.conf

sudo pacman -Syyu

echo "################################################"
echo "###          SMDLinux repo's added          ####"
echo "################################################"
