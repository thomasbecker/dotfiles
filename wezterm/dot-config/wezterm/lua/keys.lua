local wezterm = require("wezterm")
local act = wezterm.action

local M = {}

M.apply_to_config = function(config)
	config.keys = {
		{ key = "0", mods = "CTRL", action = act.PaneSelect },
		{ key = "PageUp", mods = "SHIFT", action = act.ScrollByPage(-0.75) },
		{ key = "PageDown", mods = "SHIFT", action = act.ScrollByPage(0.75) },
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

	config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }
end

return M
