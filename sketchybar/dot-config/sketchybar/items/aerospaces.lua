local colors = require("colors")
local inspect = require("inspect")
local icons = require("icons")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

function GetCommandOutput(command)
	local output = {}

	local handle = assert(io.popen(command))
	local result = handle:read("*a")
	handle:close()
	for string in string.gmatch(result, "[^\r\n]+") do
		table.insert(output, string)
	end

	return output
end

local workspaces = GetCommandOutput("aerospace list-workspaces --all")

for i, workspace in ipairs(workspaces) do
	local space_id = "space." .. workspace
	local space = sbar.add("item", space_id, {
		icon = {
			font = { family = settings.font.numbers },
			string = workspace,
			padding_left = 15,
			padding_right = 8,
			color = colors.white,
			highlight_color = colors.red,
		},
		label = {
			padding_right = 20,
			color = colors.grey,
			highlight_color = colors.white,
			font = "sketchybar-app-font:Regular:16.0",
			y_offset = -1,
		},
		padding_right = 1,
		padding_left = 1,
		background = {
			color = colors.bg1,
			border_width = 0,
			height = 26,
			border_color = colors.black,
		},
		popup = { background = { border_width = 5, border_color = colors.black } },
		click_script = "aerospace workspace " .. workspace,
	})

	spaces[workspace] = space

	-- Single item bracket for space items to achieve double border on highlight
	local space_bracket = sbar.add("bracket", { space.name }, {
		background = {
			color = colors.transparent,
			border_color = colors.bg2,
			height = 28,
			border_width = 1,
		},
	})

	-- Padding space
	sbar.add("space", "space.padding." .. workspace, {
		space = workspace,
		script = "",
		width = settings.group_paddings,
	})

	local space_popup = sbar.add("item", {
		position = "popup." .. space.name,
		padding_left = 5,
		padding_right = 0,
		background = {
			drawing = true,
			image = {
				corner_radius = 9,
				scale = 0.2,
			},
		},
	})

	space:subscribe("space_change", function(env)
		local selected = env.SELECTED == "true"
		local color = selected and colors.bg2 or colors.grey
		space:set({
			icon = { highlight = selected },
			label = { highlight = selected },
			background = { border_color = selected and colors.bg2 or colors.black },
		})
		space_bracket:set({
			background = { border_color = color },
		})
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({ popup = { drawing = false } })
	end)
end

local space_window_observer = sbar.add("item", {
	drawing = false,
	updates = true,
})

local spaces_indicator = sbar.add("item", {
	padding_left = -3,
	padding_right = 0,
	icon = {
		padding_left = 8,
		padding_right = 9,
		color = colors.grey,
		string = icons.switch.on,
	},
	label = {
		width = 0,
		padding_left = 0,
		padding_right = 8,
		string = "Spaces",
		color = colors.bg1,
	},
	background = {
		color = colors.with_alpha(colors.grey, 0.0),
		border_color = colors.with_alpha(colors.bg1, 0.0),
	},
})

space_window_observer:subscribe("space_windows_change", function(env)
	for _, workspace in pairs(workspaces) do
		local icon_line = ""
		local apps = GetCommandOutput(
			"aerospace list-windows --workspace " .. workspace .. " | awk -F'|' '{gsub(/^ *| *$/, \"\", $2); print $2}'"
		)
		if next(apps) == nil then
			icon_line = "-"
		end
		for _, app in pairs(apps) do
			local lookup = app_icons[app]
			local icon = ((lookup == nil) and app_icons["default"] or lookup)
			icon_line = icon_line .. " " .. icon
		end
		sbar.animate("tanh", 10, function()
			spaces[workspace]:set({ label = icon_line })
		end)
	end
end)

spaces_indicator:subscribe("mouse.entered", function(_)
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = { alpha = 1.0 },
				border_color = { alpha = 1.0 },
			},
			icon = { color = colors.bg1 },
			label = { width = "dynamic" },
		})
	end)
end)

spaces_indicator:subscribe("mouse.exited", function(_)
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = { alpha = 0.0 },
				border_color = { alpha = 0.0 },
			},
			icon = { color = colors.grey },
			label = { width = 0 },
		})
	end)
end)

spaces_indicator:subscribe("mouse.clicked", function(_)
	sbar.trigger("swap_menus_and_spaces")
end)
