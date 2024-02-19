media=(
	icon.background.drawing=on
	icon.background.image=media.artwork
	icon.background.image.corner_radius=9
	label.padding_left=15
	script="$PLUGIN_DIR/media.sh"
	label.max_chars=c5
	scroll_texts=on
	updates=on
)

sketchybar --add item media center \
	--set media "${media[@]}" \
	--subscribe media media_change
