borderFile=/tmp/borders

if [[ -f /tmp/borders ]]; then
	borders width=0
	yabai -m config external_bar main:0:0
	yabai -m space --padding abs:2:2:2:2 --gap abs:3
	rm $borderFile
else
	borders width=5
	yabai -m config external_bar main:27:0
	yabai -m space --padding abs:10:10:10:10 --gap abs:6
	touch $borderFile
fi

sketchybar --bar hidden=toggle
