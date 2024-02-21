brightness=(
	script="~/.config/sketchybar/plugins/brightness.sh"
	background.color=0xff3B4252
	background.height=20
	update_freq=1
	padding_right=5
	icon=
)
sketchybar -m --add item brightness right \
	--set brightness "${brightness[@]}"

# sketchybar -m --add item brightness_logo right \
# 	--set brightness_logo icon= \
# 	background.color=0xffEBCB8B \
# 	background.height=20 \
# 	background.padding_left=5
