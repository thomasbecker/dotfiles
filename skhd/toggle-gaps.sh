borderFile=/tmp/borders

if [[ -f /tmp/borders ]]; then
	borders width=0
	yabai -m config external_bar main:0:0
	rm $borderFile
else
	borders width=5
	yabai -m config external_bar main:27:0
	touch $borderFile
fi

sketchybar --bar hidden=toggle
