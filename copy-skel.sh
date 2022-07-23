##!/bin/bash

echo -e " [${g}✔${endc}]::Copying all files and folders from ${b}${bu}[ /etc/skel to ~ ]${endc}${enda}"
echo
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~