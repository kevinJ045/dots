#!/bin/bash

BLA_modern_metro=(0.15 ▰▱▱▱▱▱▱ ▰▰▱▱▱▱▱ ▰▰▰▱▱▱▱ ▱▰▰▰▱▱▱ ▱▱▰▰▰▱▱ ▱▱▱▰▰▰▱ ▱▱▱▱▰▰▰ ▱▱▱▱▱▰▰ ▱▱▱▱▱▱▰ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ ▱▱▱▱▱▱▱ )

declare -a BLA_active_loading_animation

BLA::play_loading_animation_loop() {
  while true ; do
    for frame in "${BLA_active_loading_animation[@]}" ; do
      printf "\r%s" "├ ${frame}"
      sleep "${BLA_loading_animation_frame_interval}"
    done
  done
}

BLA::start_loading_animation() {
  BLA_active_loading_animation=( "${@}" )
  # Extract the delay between each frame from array BLA_active_loading_animation
  BLA_loading_animation_frame_interval="${BLA_active_loading_animation[0]}"
  unset "BLA_active_loading_animation[0]"
  tput civis # Hide the terminal cursor
  BLA::play_loading_animation_loop &
  BLA_loading_animation_pid="${!}"
}

BLA::stop_loading_animation() {
  kill "${BLA_loading_animation_pid}" &> /dev/null
  printf "\r%s" "│            "
  tput cnorm # Restore the terminal cursor
}

function print(){
	start="╭"
	empty="│"
	default="├"
	end="╰"

	g=$default
	all=("$@")
	last=${!#}

	if [ $last == 's' ]; then 
		g=$start
		all=("${@:1:$#-1}")
	elif [ $last == 'e' ]; then 
		g=$end
		all=("${@:1:$#-1}")
	else
		g=$default
	fi

	if [ $# -eq 0 ]; then
		g=$empty
	fi
	
	color_text $g ${all[*]}
}


function color_text() {
    text=${@:1:$#-1}
    color=${!#}

    # ANSI escape codes
    ANSI_RESET='\033[0m'
    ANSI_BOLD='\033[1m'
    ANSI_UNDERLINE='\033[4m'
    ANSI_BLINK='\033[5m'
    ANSI_REVERSE='\033[7m'
    ANSI_BLACK='\033[30m'
    ANSI_RED='\033[31m'
    ANSI_GREEN='\033[32m'
    ANSI_YELLOW='\033[33m'
    ANSI_BLUE='\033[34m'
    ANSI_MAGENTA='\033[35m'
    ANSI_CYAN='\033[36m'
    ANSI_WHITE='\033[37m'

    # Map color names to ANSI escape codes
    case $color in
        "red") ANSI_COLOR=$ANSI_RED ;;
        "bred") ANSI_COLOR=$ANSI_BOLD$ANSI_RED ;;
        "green") ANSI_COLOR=$ANSI_GREEN ;;
        "bgreen") ANSI_COLOR=$ANSI_BOLD$ANSI_GREEN ;;
        "yellow") ANSI_COLOR=$ANSI_YELLOW ;;
        "byellow") ANSI_COLOR=$ANSI_BOLD$ANSI_YELLOW ;;
        "blue") ANSI_COLOR=$ANSI_BLUE ;;
        "bblue") ANSI_COLOR=$ANSI_BOLD$ANSI_BLUE ;;
        "magenta") ANSI_COLOR=$ANSI_MAGENTA ;;
        "bmagenta") ANSI_COLOR=$ANSI_BOLD$ANSI_MAGENTA ;;
        "cyan") ANSI_COLOR=$ANSI_CYAN ;;
        "bcyan") ANSI_COLOR=$ANSI_BOLD$ANSI_CYAN ;;
        "white") ANSI_COLOR=$ANSI_WHITE ;;
        "bwhite") ANSI_COLOR=$ANSI_BOLD ;;
        *) ANSI_COLOR=$ANSI_RESET ;;
    esac

    if [ $ANSI_COLOR == $ANSI_RESET ]; then
		text=$@
    fi

    # Build the colorized text
    colored_text="${text:0:1}${ANSI_COLOR}${text:1}${ANSI_RESET}"

	if [ ${text:0:1} != '├' ]; then
		colored_text="${ANSI_COLOR}${text}${ANSI_RESET}"
	else
		colored_text="${text:0:1}${ANSI_COLOR}${text:1}${ANSI_RESET}"
    fi

    echo -e "$colored_text"
}

BLA_loading_animation_pid=""
function show_loading() {
	BLA::start_loading_animation "${BLA_modern_metro[@]}"
}
function hide_loading(){
    BLA::stop_loading_animation 
    if [ "$#" -gt 0 ]; then
    	text=$(color_text $@)
		printf "\r%s" "├ $text"
	fi
  	printf "\n"
}

print "Arch Makanoizer" bcyan s



packages_to_install=(
	aircrack-ng
	alacarte
	alacritty
	alsa
	adb
	apache
	apx
	apparmor
	archlinux-keyring
	blueman
	bmenu
	bluez
	boost
	bpytop
	brightnessctl
	caja
	catppuccin-gtk-theme-mocha
	chromium
	clang
	clang15
	cloudflare-warp-bin
	code
	code-features
	dart
	distrobox
	dmenu
	docker
	dos2unix
	dosfstools
	electron
	electron22
	electron17-bin
	electron25
	evtest
	exfatprogs
	f2fs-tools
	fakeroot
	fast
	feh
	ffmpeg
	ffmpeg4
	fftw
	file
	file-roller
	firefox
	flameshot
	flatpak
	flutter
	fzf
	game-devices-udev
	gedit
	gimp
	git
	gjs
	go
	gparted
	gtk2
	gtk3
	gtk4
	gtkd
	htop
	i3
	kazam
	legacylauncher
	logmein-hamachi
	lolcat
	lollypop
	lshw
	ly
	marco
	mariadb
	materialx
	maven
	mediainfo
	mesa
	micro
	nano
	ncdu
	neofetch
	neon
	net-tools
	networkmanager
	nnn
	node
	npm
	nvm
	pacui
	pam
	pamac-cli
	pambase
	pango
	papirus-icon-theme
	php
	picom
	pixman
	plymouth
	polybar
	postgresql
	pulseaudio
	pulseaudio-also
	pulseaudio-bluetooth
	python
	qemu
	qt5
	qt6
	ranger
	rofi
	rust
	scrcpy
	steam
	sway
	swaybg
	typescript
	ufw
	vlc
	waydroid
	waydroid-script-git
	wayland
	wayland-protocols
	wayland-utils
	wine
	wine-mono
	winetricks
	wl-clipboard
	xdman
	xdotool
	yaml-cpp
	yarn
	yay
	zsh
	zsh-autosuggestions
	zsh-completions
	zsh-history-substring-search
	zsh-syntax-highlighting
	zsh-theme-powerlevel10k
)


# if [ "$EUID" -ne 0 ]; then
#     print "Please run this script with sudo." bred e
#     exit 1
# fi

print
print Initiating package installation byellow


function install_packages(){
	print
	print Installing packages byellow
	sudo -v
	if [ $? -eq 1 ]; then
		exit
	fi
	print
	installer_pid=''
	show_loading
	yes | sudo pacman -Syuu ${packages_to_install[@]} > /dev/null 2>&1 &
	installer_pid=$!
	wait $installer_pid
	if [ $? -eq 0 ]; then
	   sleep 1
	   hide_loading "Package installation completed" bgreen
	else
	   sleep 1
	   hide_loading "Package installation failed" bred
	   install_packages
	fi
	
}


install_packages

print
print Copying config files bblue
print

function copy_configs(){
	CONFIGPATH=$HOME/.config
	
	show_loading
	
	cp -r ./nvim $CONFIGPATH
	cp -r ./rofi $CONFIGPATH
	cp -r ./tmux $CONFIGPATH
	cp -r ./waybar $CONFIGPATH
	cp -r ./alacritty $CONFIGPATH
	cp -r ./i3 $CONFIGPATH
	cp -r ./tilda $CONFIGPATH
	cp -r ./sway $CONFIGPATH
	cp -r ./picom.conf $CONFIGPATH
	
	hide_loading "Config files has been copied" bgreen
}

copy_configs

print Makanoized your arch bgreen e
