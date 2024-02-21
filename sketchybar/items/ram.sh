FONT_SIZE=10

sketchybar -m --add item ram_label right \
	--set ram_label label.font.size=$FONT_SIZE \
	label=RAM \
	y_offset=5 \
	width=0 \
	\
	--add item ram_percentage right \
	--set ram_percentage label.font.size=$FONT_SIZE \
	y_offset=-4 \
	update_freq=1 \
	script="~/.config/sketchybar/plugins/ram.sh"
