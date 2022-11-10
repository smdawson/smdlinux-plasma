##!/bin/bash
#set -e
#
##########################################################
#                                                        #
#               SMD-Linux Install Script                 #
#  ArchLinux Applications Automatic Installation Script  #
#  Inspired and Forked From                              #
#  https://github.com/SofianeHamlaoui/ArchI0             #
#  And                                                   #
#  https://github.com/arcolinuxd/arco-xfce               #
##########################################################
#  +FIRST  : sudo chmod +x smdlinux-install.sh           #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./smdlinux-plasma-install.sh             # 
#                                                        #
#  Add smdlinux repos and key before running             #
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
version="20220509"

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

category Bash

list=(
asciiquarium
cmatrix
cool-retro-term
cowfortune
fortune-mod
mc
ranger
sl
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Bash

###############################################################################

category Accessories

list=(
pipes.sh
cronie
mintstick-git
yad
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Accessories

###############################################################################

category Development

list=(
ansible-core
arduino
atom
devtools
geany
git
gitahead-bin
meld
#sublime-text-3
sshpass
terraform
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Development

###############################################################################

category Fonts

list=(
smdlinux-fonts-git
awesome-terminal-fonts
adobe-source-sans-pro-fonts
cantarell-fonts
noto-fonts
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-ms-fonts
ttf-roboto
ttf-ubuntu-font-family
tamsyn-font
ttf-meslo
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Fonts

###############################################################################

category Games

list=(
#kmines
steam-native-runtime
steam
#supertuxkart
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Games

###############################################################################

category Graphics

list=(
blender
cura	
gimp
inkscape
nomacs
openscad
#prusa-slicer
#slic3r
superslicer-bin
superslicer-profiles-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Graphics

###############################################################################

category Internet

list=(
discord_arch_electron
filezilla
firefox
hexchat
qbittorrent
telegram-desktop
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Internet

###############################################################################

category Multimedia

list=(
audacity
deadbeef
obs-studio
peek
pithos
vlc
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Multimedia

###############################################################################

category Office

list=(
calibre
dropbox
evince
#evolution
gnucash
hunspell
hunspell-en_US
hyphen
hyphen-en
joplin
joplin-desktop
libmythes
mythes-en
libreoffice-fresh
obsidian
perl-date-manip
perl-finance-quote
#thunderbird
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Office

###############################################################################

category Printers

list=(
cups
cups-pdf
ghostscript
gsfonts
gutenprint
gtk3-print-backends
libcups
system-config-printer
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Printers

sudo systemctl enable cups.service

echo
echo -e " [${g}✔${endc}]::Print Services ${b}${r}[Enabled]${endc}${enda}"
echo

###############################################################################

category SMD-Linux-General

list=(
smdlinux-bin-git
#smdlinux-hblock-git
smdlinux-plasma-hblock-git
smdlinux-root-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_catrgory SMD-Linux-General

###############################################################################

category Sound

list=(
pulseaudio
pulseaudio-alsa
#pavucontrol
alsa-firmware
alsa-lib
alsa-plugins
alsa-utils
gstreamer
gst-plugins-good
gst-plugins-bad
gst-plugins-base
gst-plugins-ugly
playerctl
#volumeicon
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_catrgory Sound

###############################################################################

category System

list=(
arc-gtk-theme
dconf-editor
dmenu
dmidecode
glances
gnome-keyring
gparted
go
grsync
hardinfo
hddtemp
htop
hwinfo
jq
lsb-release
man-db
man-pages
neofetch
smdlinux-neofetch-git
net-tools
numlockx
#octopi
#octopi-notifier-frameworks
#pamac-aur
#pamac-tray-icon-plasma
perl-file-mimeinfo
python-zeroconf
python-libcharon
python-libusb1
python-sentry_sdk
reflector
screenfetch
simple-scan
#sysstat
ufw-extras
vnstat
w3m
wget
wmctrl
whois
xdo
xdotool 
zenity
zsh
zsh-completions
zsh-syntax-highlighting
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category System

###############################################################################

category Utilities

list=(
bashtop
bitwarden-bin
conky-lua
conky-manager2-git
smdlinux-conky-plasma-git
cdrdao
dnsutils
downgrade
dropbox
dvd+rw-tools
expac
hardcode-fixer-git
inxi
inetutils
jscal
mugshot
seahorse
the_platinum_searcher-bin
trizen
#variety
xclip
yay-bin
youtube-dl
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Utilities

###############################################################################

category Unpack

list=(
unace
unrar
zip
unzip
sharutils
uudeview
arj
cabextract
file-roller
p7zip
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done

end_category Unpack

###############################################################################

category Final

list=(
hardcode-fixer-git
)

count=0

for name in "${list[@]}" ; do
  count=$[count+1]
  echo -e " ${y}Installing package # "$count" ${b}["$name"]${enda} ${endc}" ;
  install $name
done


echo -e " [${r}!${endc}]::Fixing hardcoded icon paths for applications ${b}${r}[Wait for it]${endc}${enda}"
echo
sudo hardcode-fixer
echo -e " [${g}✔${endc}]::Fixing hardcoded icon paths for applications ${b}${g}[Completed]${endc}${enda}"

end_category Final

###############################################################################

echo -e " [${g}✔${endc}]::Copying all files and folders from ${b}${bu}[ /etc/skel to ~ ]${endc}${enda}"
echo
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~

echo -e " [${g}✔${endc}]::Software For ${b}${r}[SMD-Linux Plasma]${endc}${enda} Installed"
echo
echo -e " ${bu}SMD-Arch Installation Script Version${b} $version ${enda} ${endc}"