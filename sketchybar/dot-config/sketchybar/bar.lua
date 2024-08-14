local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
	topmost = "window",
	height = 42,
	border_width = 0,
	color = colors.transparent,
	border_color = colors.bar.border,
	corner_radius = 9,
	padding_right = 0,
	padding_left = 0,
	y_offset = 10,
	margin = 14,
})
