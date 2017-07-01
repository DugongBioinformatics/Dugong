#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install Xfce4 UI components"
apt-get update && apt-get install -y --allow-unauthenticated --no-install-recommends libstdc++5 libvncserver0 libaio-dev sysstat ksh expat \
libelf-dev desktop-base exo-utils gtk2-engines-xfce libexo-1-0 libexo-common libgarcon-1-0 libgarcon-common libthunarx-2-0 \
libxfce4ui-1-0 libxfce4util-bin libxfce4util-common libxfce4util4 libxfconf-0-2 orage thunar thunar-data thunar-volman \
xfce-keyboard-shortcuts xfce4-appfinder xfce4-panel xfce4-session xfce4-settings xfce4-utils xfconf xfdesktop4 \
xfdesktop4-data xfwm4 xfwm4-themes xubuntu-icon-theme xfce4 supervisor xterm xfce4-terminal && \
apt-get purge -y pm-utils xscreensaver* && apt-get clean -y
