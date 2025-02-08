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
	-- Add timeout command wrapper
	local cmd =
		[[timeout 10 bash -c "cd /Users/tbecker/workspaces/mytoyota && source mytoyota/bin/activate && python3 battery-status.py"]]

	local status_handler = function(soc)
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

		-- Error handling for the response
		local success, value = pcall(function()
			if not soc or soc == "" then
				error("Empty response from battery status script")
			end
			return tonumber(soc)
		end)

		local color = colors.red -- Default to red if there's an error
		local label = "!" -- Use ! to indicate error

		if success and value and value > 0 then
			label = tostring(value)
			color = getThresholdColor(value)
		end

		car_status:set({
			icon = {
				color = color,
			},
			label = { string = label },
		})
	end

	-- Execute with error handling
	local success, err = pcall(function()
		sbar.exec(cmd, status_handler)
	end)

	if not success then
		car_status:set({
			icon = {
				color = colors.red,
			},
			label = { string = "E" }, -- E for error
		})
	end
end)

sbar.add("bracket", "widgets.car_status.bracket", { car_status.name }, {
	background = { color = colors.bg1 },
})

sbar.add("item", "widgets.car_status.padding", {
	position = "right",
	width = settings.group_paddings,
})
