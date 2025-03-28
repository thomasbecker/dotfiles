local wezterm = require("wezterm")
local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()
local keys = require("lua.keys")
local tabs = require("lua.tabs")
local colors = dofile(os.getenv("HOME") .. "/.config/themes/colors.lua")

local os_name = package.config:sub(1, 1) == "\\" and "windows" or "unix"
if os_name == "windows" then
	config.default_domain = "WSL:rancher-desktop"
	-- on mac yabai adds the transparency
end

config.front_end = "WebGpu"
config.max_fps = 120
config.window_background_opacity = 0.85

workspace_switcher.apply_to_config(config)

wezterm.on("gui-startup", function()
	local _, _, window = mux.spawn_window({})
	window:gui_window():maximize()
end)
local font = "JetBrainsMono Nerd Font Mono"
config.font = wezterm.font(font)
config.font_size = 14.0
config.adjust_window_size_when_changing_font_size = false
-- config.color_scheme = "Tokyo Night Storm"
config.color_scheme = "catppuccin-mocha"

config.scrollback_lines = 25000
config.window_decorations = "RESIZE"
config.window_frame = {
	font = wezterm.font({ family = font, weight = "Bold" }),
	font_size = 11.0,
	active_titlebar_bg = colors.mantle,
	inactive_titlebar_bg = colors.mantle,
}
config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 1,
}
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.inactive_pane_hsb = {
	saturation = 0.8,
	brightness = 0.5,
}

config.colors = {
	cursor_bg = colors.green,
	cursor_fg = colors.mantle,
}

keys.apply_to_config(config)
tabs.apply_to_config(config)

return config
