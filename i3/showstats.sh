
dir="~/.config/i3"

mem="$(mem)"
bat="$(batp)"

msg(){
	rofi -no-config -theme "$dir/message.rasi" -e "$1"
	# ans=$(echo "yes no" | dmenu -p 'Exit [y]es/[N]o?');
}

msg "$mem $bat"
