
dir="~/.config/i3"

# ans=$(echo "" | rofi -dmenu\
		# -no-config\
        # -i\
		# -no-fixed-num-lines\
		# -p "Are You Sure? : "\
		# -theme $dir/exit.rasi);

ans=$(echo -e "yes\nno" | dmenu -p 'Exit? ' -nb "#1e1e2e" -nf "#cdd6f4" -sb "#89dceb" -sf "#1e1e2e")

msg() {
	rofi -no-config -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
	# ans=$(echo "yes no" | dmenu -p 'Exit [y]es/[N]o?');
}

echo $ans

if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" ]]; then
	swaymsg exit
elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
	exit 0
else
	msg
fi
