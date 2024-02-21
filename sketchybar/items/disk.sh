FONT_SIZE=10
sketchybar -m --add item disk_label right \
	--set disk_label label.font.size=$FONT_SIZE label=SSD \
	label.align=center \
	y_offset=5 \
	width=0 \
	\
	--add item disk_percentage right \
	--set disk_percentage label.font.size=$FONT_SIZE y_offset=-4 \
	label.align=center \
	update_freq=1 \
	script="~/.config/sketchybar/plugins/disk.sh"
