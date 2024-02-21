media=(
	icon.background.drawing=on
	icon.background.image=media.artwork
	icon.background.image.corner_radius=6
	icon.background.image.scale=0.8
	script="$PLUGIN_DIR/media.sh"
	label.max_chars=35
	scroll_texts=on
	updates=on
)

sketchybar --add item media center \
	--set media "${media[@]}" \
	--subscribe media media_change
