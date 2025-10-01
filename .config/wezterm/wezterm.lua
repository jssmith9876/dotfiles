local wezterm = require("wezterm")
local keybindings = require("keybindings")
local tabs = require("tabs")
local startup = require("startup")
require("right_status")

local config = wezterm.config_builder()

-- General settings
config.scrollback_lines = 5000

-- Set the default shell to fish
config.default_prog = { "/opt/homebrew/bin/fish", "-l" }

-- Colors
config.color_scheme = "Dracula (Official)"

-- Fonts
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"MesloLGS Nerd Font Mono",
})
config.font_size = 14

-- Window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 8
config.status_update_interval = 1000

-- Panes
config.inactive_pane_hsb = { saturation = 0.8, brightness = 0.7 }

-- Disable the stupid bell
config.audible_bell = "Disabled"

-- Launcher menu... Needs more tweaks
config.launch_menu = {
	{
		args = { "btop" },
	},
}

-- Apply external modules
keybindings.apply(config)
tabs.apply(config)

-- and finally, return the configuration to wezterm
return config
