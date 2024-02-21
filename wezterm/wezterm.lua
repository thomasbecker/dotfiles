local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux
local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
local font = "JetBrainsMono Nerd Font Mono"
config.font = wezterm.font(font)
config.font_size = 14.0
config.adjust_window_size_when_changing_font_size = false
-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme = "catppuccin-mocha"

config.scrollback_lines = 5000
-- config.window_background_opacity = 0.85
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font({ family = font, weight = "Bold" }),
	font_size = 12.0,
	active_titlebar_bg = "#333333",
	inactive_titlebar_bg = "#333333",
}

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.6,
}
local primary_bg = "#24283b"

local tab_bar_colors = {
	bg = primary_bg,
	active = {
		bg = primary_bg,
		fg = "#7aa2f7",
	},
	inactive = {
		bg = primary_bg,
		fg = "#565f89",
		hover = {
			bg = "#414868",
			fg = "#bdc7f0",
		},
	},
	new = {
		bg = primary_bg,
		fg = "#bdc7f0",
		hover = {
			bg = primary_bg,
			fg = "#cfc9c2",
		},
	},
}
config.colors = {
	cursor_bg = "#52ad70",
	cursor_fg = "black",
	tab_bar = {
		-- The color of the strip that goes along the top of the window
		-- (does not apply when fancy tab bar is in use)
		background = tab_bar_colors.bg,

		-- The active tab is the one that has focus in the window
		active_tab = {
			-- The color of the background area for the tab
			bg_color = tab_bar_colors.active.bg,
			-- The color of the text for the tab
			fg_color = tab_bar_colors.active.fg,

			-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
			-- label shown for this tab.
			-- The default is "Normal"
			intensity = "Bold",

			-- Specify whether you want "None", "Single" or "Double" underline for
			-- label shown for this tab.
			-- The default is "None"
			underline = "None",

			-- Specify whether you want the text to be italic (true) or not (false)
			-- for this tab.  The default is false.
			italic = false,

			-- Specify whether you want the text to be rendered with strikethrough (true)
			-- or not for this tab.  The default is false.
			strikethrough = false,
		},

		-- Inactive tabs are the tabs that do not have focus
		inactive_tab = {
			bg_color = tab_bar_colors.inactive.bg,
			fg_color = tab_bar_colors.inactive.fg,
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over inactive tabs
		inactive_tab_hover = {
			bg_color = tab_bar_colors.inactive.hover.bg,
			fg_color = tab_bar_colors.inactive.hover.fg,
			italic = false,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `inactive_tab_hover`.
		},

		-- The new tab button that let you create new tabs
		new_tab = {
			bg_color = tab_bar_colors.new.bg,
			fg_color = tab_bar_colors.new.fg,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = tab_bar_colors.new.hover.bg,
			fg_color = tab_bar_colors.new.hover.fg,
			-- italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }
config.keys = {
	{ key = "0", mods = "CTRL", action = act.PaneSelect },
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "t",
		mods = "CMD|SHIFT",
		action = act.ShowTabNavigator,
	},
	{
		key = ",",
		mods = "CMD",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
			},
			args = {
				"/opt/homebrew/bin/nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
	{
		key = "R",
		mods = "CMD|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- other keys
}
return config
