local colors = {
	black = 0xff11111b,
	white = 0xffcdd6f4,
	red = 0xfff38ba8,
	green = 0xffa6e3a1,
	blue = 0xff89b4fa,
	teal = 0xff94e2d5,
	yellow = 0xfff9e2af,
	orange = 0xfffab387,
	magenta = 0xffcba6f7,
	grey = 0xff9399b2,
	transparent = 0x00000000,
	mantle = 0xff181825,
	crust = 0xff11111b,

	bar = {
		bg = 0xff1e1e2e,
		border = 0xffa6e3a1,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff313244,
	bg2 = 0xff585b70,

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}

colors.popup.border = colors.teal
colors.bg2 = colors.teal

return colors
