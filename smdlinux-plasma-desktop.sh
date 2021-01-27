##!/bin/bash
#set -e
#
##########################################################
#                                                        #
#          SMD-Linux-Plasma desktop script               #
#  ArchLinux Applications Automatic Installation Script  #
#  Inspired and Forked From                              #
#  https://github.com/SofianeHamlaoui/ArchI0             #
#  And                                                   #
#  https://github.com/arcolinuxd/arco-xfce               #
##########################################################
#  +FIRST  : sudo chmod +x smdlinux-plasma-desktop.sh    #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./smdlinux-plasma-desktop.sh             #
##########################################################
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
version="20201220"

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

function category {
	echo -e " [${g}✔${endc}]::Installing Software For Category ${b}${bu}["$1"]${endc}${enda}"
	echo
}

function end_category {
	echo
    echo -e " [${g}✔${endc}]::Category ${bu}${b}["$1"]${enda}${endc} Installed!"
    echo
}

###############################################################################

category SMD-Linux-Desktop

list=(
chromeos-kde-git
mojave-gtk-theme
mcmojave-kde-theme-git
tela-icon-theme
surfn-arc-breeze-icons
mcmojave-circle-icon-theme-git
sardi-icons
kde-rubberband-maximize-animation-git
kvantum-qt5
latte-dock
smdlinux-sddm-theme-plasma-git
smdlinux-splash-dark-plasma-git
libappindicator-gtk3
kwin-scripts-forceblur
material-cursors-git
smdlinux-config-plasma-git
smdlinux-plasma-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

###############################################################################

end_category SMD-Linux-Desktop


###############################################################################


echo -e " [${g}✔${endc}]::Copying all files and folders from ${b}${bu}[ /etc/skel to ~ ]${endc}${enda}"
echo
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~
echo -e " [${g}✔${endc}]::Software has been installed${endc}${enda}"
echo
echo -e " ${bu}SMD-Arch Installation Script Version${b} $version ${enda} ${endc}"
