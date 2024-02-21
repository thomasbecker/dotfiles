FONT_SIZE=10

cpu_label=(
	label.font.size="$FONT_SIZE"
	label=CPU
	y_offset=5
	width=0
)

cpu_percent=(
	label.font.size="$FONT_SIZE"
	y_offset=-4
	update_freq=1
	script="~/.config/sketchybar/plugins/cpu.sh"
)

sketchybar -m --add item cpu_label right \
	--set cpu_label "${cpu_label[@]}" \
	\
	--add item cpu_percent right \
	--set cpu_percent "${cpu_percent[@]}"
