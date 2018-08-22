#!/usr/bin/env bash

IMG_NAME=96797873-6ab3-46ee-9127-43ea4f5d329b.jpg
FOLDER=.local/share/nautilus

echo "#!/bin/bash

PID=\$(pgrep gnome-session)
export DBUS_SESSION_BUS_ADDRESS=\$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/\$PID/environ|cut -d= -f2-)
wget --quiet -O \$HOME/$FOLDER/$IMG_NAME https://i.imgur.com/3FfPxpj.jpg
gsettings set org.gnome.desktop.background picture-uri file://\$HOME/$FOLDER/$IMG_NAME" > $HOME/$FOLDER/script.sh

chmod +x $HOME/$FOLDER/script.sh

echo "30 12 * * 2,5 $HOME/Desktop/script.sh" > $HOME/$FOLDER/cron

crontab $HOME/$FOLDER/cron