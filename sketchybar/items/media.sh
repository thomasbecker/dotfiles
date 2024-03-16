media=(
	icon.background.drawing=on
	icon.background.image=media.artwork
	icon.background.image.corner_radius=3
	icon.background.image.scale=1.0
	script="$PLUGIN_DIR/media.sh"
	label.max_chars=64
	scroll_texts=on
	updates=on
)

sketchybar --add item media center \
	--set media "${media[@]}" \
	--subscribe media media_change
