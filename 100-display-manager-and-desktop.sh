##!/bin/bash
#set -e
#
##########################################################
#                                                        #
#            SMDLINUX-Plasma Installation script         #
#  ArchLinux Applications Automatic Installation Script  #
#  Inspired and Forked From                              #
#  https://github.com/SofianeHamlaoui/ArchI0             #
#  And                                                   #
#  https://github.com/arcolinuxd/arco-xfce               #
################################################################
#  +FIRST  : sudo chmod +x 100-display-manager-and-desktop.sh  #                
#                (Give EXEC Access To Script)                  #
#  +TO RUN    : ./100-display-manager-and-desktop.sh           #
################################################################
#                                                        #
#                DO NOT JUST RUN THIS.                   #
#       EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.         #
#                                                        #
##########################################################
#
#
#  TO DO:
#
#
######################## Variables #######################
#
# b=bold u=underline bl=black r=red g=green
# y=yellow bu=blue m=magenta c=cyan w=white
# endc=end-color enda=end-argument
b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
version="20210126"

####################### Functions ########################

function install {
  # Check If Package Is Installed
  if pacman -Qi $1 &> /dev/null; then
      echo -e " [${g}✔${endc}]::[${b}"$1"${enda}] Is Already Installed!"
  else
      sudo pacman -S --noconfirm --needed $1
      # Verify Successful Installation
    if pacman -Qi $package &> /dev/null; then
      echo -e " [${g}✔${endc}]::[${b}"$1"${enda}]: Installed!"
    else
      echo -e " [${r}!${endc}]::[${b}"$1"${enda}]: ${r}NOT Installed!${endc}"
    fi
  fi
}

echo
echo -e " [${g}✔${endc}]::[${g}${b}Installation Of Core Software${enda}${endc}]"
echo

list=(
#lightdm
#smdlinux-lightdm-gtk-greeter-plasma
#smdlinux-lightdm-gtk-greeter-settings
sddm
#sddm-kcm
smdlinux-wallpapers-git
plasma-meta
kde-applications-meta
smdlinux-sddm-theme-plasma
xdg-user-dirs
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

###############################################################################

#echo
#echo -e " [${g}✔${endc}]::[${g}${b}Copying all files and folders from /etc/skel to ~${enda}${endc}]"
#echo
#cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
#cp -arf /etc/skel/. ~

echo
echo -e " [${g}✔${endc}]::[${g}${b}Enabling SDDM Display Manager${enda}${endc}]"
echo
#sudo systemctl enable lightdm.service -f
sudo systemctl enable sddm.service -f

echo
echo -e " [${g}✔${endc}]::[${g}${b}A Minimal Functional Desktop Is Now Installed${enda}${endc}]"
echo
echo -e " ${bu}SMD-Linux Installation Script Version${b} $version ${enda} ${endc}"
echo
echo -e " [${r}!${endc}]::[${b}${r}REBOOT YOUR SYSTEM${endc}${enda}]::[${r}!${endc}]"
echo
