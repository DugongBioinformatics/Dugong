#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Xfce4 UI components"
apt-get update && apt-get install -y --allow-unauthenticated supervisor xfce4 xterm xfce4-terminal \
icedtea-8-plugin chromium-browser chromium-browser-l10n chromium-codecs-ffmpeg firefox=45* && \
apt-get purge -y pm-utils xscreensaver* && apt-mark hold firefox && apt-get clean -y
ln -s /usr/bin/chromium-browser /usr/bin/google-chrome 
echo "CHROMIUM_FLAGS='--no-sandbox --start-maximized --user-data-dir'" > $HOME/.chromium-browser.init
