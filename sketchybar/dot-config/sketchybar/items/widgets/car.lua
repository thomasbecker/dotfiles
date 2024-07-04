local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local thresholds = {
	[70] = colors.yellow,
	[50] = colors.orange,
	[30] = colors.red,
}

local car_status = sbar.add("item", "widgets.car", {
	position = "right",
	icon = {
		string = icons.car.charging,
		color = colors.green,
	},
	label = {
		string = "0",
		font = { family = settings.font.numbers },
	},
	updates = "on",
	update_freq = 60,
})

car_status:subscribe({ "routine", "car_status" }, function()
	sbar.exec(
		"cd /Users/tbecker/workspaces/mytoyota && source mytoyota/bin/activate && python3 battery-status.py",
		function(soc)
			local function getThresholdColor(count)
				local thresholdKeys = {}
				for key in pairs(thresholds) do
					table.insert(thresholdKeys, key)
				end

				table.sort(thresholdKeys, function(a, b)
					return a < b
				end)

				for _, threshold in ipairs(thresholdKeys) do
					if tonumber(count) <= threshold then
						return thresholds[threshold]
					end
				end
				return colors.green
			end
			local color = colors.green
			local label = "0"
			if tonumber(soc) > 0 then
				label = soc
				color = getThresholdColor(soc)
			end
			car_status:set({
				icon = {
					color = color,
				},
				label = { string = label },
			})
		end
	)
end)

sbar.add("bracket", "widgets.car_status.bracket", { car_status.name }, {
	background = { color = colors.bg1 },
})

sbar.add("item", "widgets.car_status.padding", {
	position = "right",
	width = settings.group_paddings,
})
