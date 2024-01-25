dir="~/.config/i3"

ans=$(echo -e "350\n360\n370" | dmenu -p 'Insert Width: ' -nb "#1e1e2e" -nf "#cdd6f4" -sb "#89dceb" -sf "#1e1e2e")

swaymsg resize set $ans px
