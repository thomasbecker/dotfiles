borderFile=/tmp/borders

if [[ -f /tmp/borders ]]; then
	borders width=0
	yabai -m config external_bar main:0:0
	yabai -m space --padding abs:2:2:2:2 --gap abs:4
	rm $borderFile
else
	borders width=5
	yabai -m config external_bar main:45:0
	yabai -m space --padding abs:20:20:20:20 --gap abs:20
	touch $borderFile
fi

sketchybar --bar hidden=toggle
