#!/bin/bash
set -e

WIDTH=${WIDTH:-2256}
HEIGHT=${HEIGHT:-1504}

if ! dpkg -l | grep -q "^ii  plymouth-x11 "; then
	apt install plymouth-x11
fi

quit_on_esc() {
	while true; do
  read -rsn1 key

  # Check if the key pressed is the Esc key (escape sequence is '\e')
  if [[ $key == $'\e' ]]; then
    sudo plymouth quit
    break
  fi
	done
}

run_plymouth() {
	sudo plymouthd --debug --kernel-command-line="splash video=${WIDTH}x${HEIGHT}"
	sudo plymouth show-splash --debug
	sudo plymouth display-message --text="Press Esc to quit preview"
	sleep 2
	sudo plymouth ask-for-password --prompt="Enter password (Press Esc to quit preview)"
	sleep 2
	sudo plymouth quit
}


run_plymouth &

quit_on_esc
