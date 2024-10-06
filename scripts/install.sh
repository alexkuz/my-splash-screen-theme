#!/bin/sh
set -e

THEMES_DIR=${THEMES_DIR:-/usr/share/plymouth/themes}
THEME_NAME=${THEME_NAME:-my-splash-screen-theme}

THEME_PATH=$THEMES_DIR/$THEME_NAME/$THEME_NAME.plymouth

# if [ -L "$THEMES_DIR/$THEME_NAME" ]; then
# 	sudo rm "$THEMES_DIR/$THEME_NAME"
# 	sudo ln -s "$(realpath .)" "$THEMES_DIR/$THEME_NAME"
# fi
sudo rm -rf "$THEMES_DIR/$THEME_NAME"
sudo cp -r . "$THEMES_DIR/$THEME_NAME"
sudo update-alternatives --install "$THEMES_DIR/default.plymouth" default.plymouth "$THEME_PATH" 200
sudo update-alternatives --set default.plymouth "$THEME_PATH"
sudo update-initramfs -u
