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
	sudo plymouth display-message --text="test message"
	sleep 5
	sudo plymouth display-message --text="test message test message test message test message test message test message test message test message"
	sleep 5
	sudo plymouth ask-for-password --prompt="test prompt"
	sleep 2
	sudo plymouth quit
}


run_plymouth &

quit_on_esc
