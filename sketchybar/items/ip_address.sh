sketchybar --add item ip_address right \
	--set ip_address script="$PLUGIN_DIR/ip_address.sh" \
	background.border_color="$BACKGROUND_2" \
	update_freq=30 \
	padding_left=2 \
	padding_right=8 \
	icon.highlight=on \
	icon.padding_left=5 \
	label.highlight=on \
	label.padding_right=8 \
	--subscribe ip_address wifi_change
