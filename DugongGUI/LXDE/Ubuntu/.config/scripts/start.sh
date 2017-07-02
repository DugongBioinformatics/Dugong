#! /bin/bash

if [ ! -e "$HOME/.config" ] ; then
  cp -R /etc/skel/. $HOME/ 
  cp -R /etc/skel/* $HOME/
fi
if [ "$*" = "" ] ; then
  openbox --sm-disable &
  pcmanfm --desktop &
  lxpanel
else
  eval $*
fi
