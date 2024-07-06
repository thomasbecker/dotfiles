local icons = require("icons")
local settings = require("settings")
local colors = require("colors")

-- Padding item required because of bracket

local vpn = sbar.add("item", "widgets.vpn", {
	position = "right",
	icon = {
		padding_left = 8,
		font = { size = 18.0 },
		string = icons.network.vpn,
		color = colors.red,
	},
	updates = true,
	update_freq = 10,
})

vpn:subscribe({ "routine", "power_source_change", "system_woke" }, function()
	local _, _, exit_type = os.execute("ifconfig -a | grep 172 > /dev/null")
	if exit_type == 1 then
		vpn:set({
			drawing = "off",
		})
	else
		vpn:set({
			drawing = "on",
		})
	end
end)

sbar.add("bracket", "widgets.vpn.bracket", { vpn.name }, {
	background = { color = colors.bg1 },
})

sbar.add("item", "widgets.vpn.padding", {
	position = "right",
	width = settings.group_paddings,
})
