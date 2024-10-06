#!/bin/sh
set -e

WIDTH=${WIDTH:-2256}
HEIGHT=${HEIGHT:-1504}

if ! dpkg -l | grep -q "^ii  plymouth-x11 "; then
	apt install plymouth-x11
fi

sudo plymouthd --debug --kernel-command-line="splash video=${WIDTH}x${HEIGHT}"
sudo plymouth show-splash --debug
sleep 2
sudo plymouth ask-for-password --prompt="test prompt"
sudo plymouth display-message --text="test message"
sleep 2
sudo plymouth quit
