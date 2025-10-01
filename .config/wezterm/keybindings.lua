local wezterm = require("wezterm")
local act = wezterm.action

local key_module = {}

local keys = {
	{ key = "l", mods = "SUPER", action = act.ShowLauncher },
	{ key = "t", mods = "SUPER|SHIFT", action = act.ShowTabNavigator },

	-- New tab
	{
		key = "t",
		mods = "SUPER",
		action = act.Multiple({
			-- Create a new tab
			act.SpawnTab("CurrentPaneDomain"),

			-- Create stacked panes on the right third of the screen
			act.SplitPane({
				direction = "Right",
				size = { Percent = 33 },
			}),
			act.SplitPane({
				direction = "Down",
				size = { Percent = 49 },
			}),
		}),
	},

	-- Switch tabs
	{ key = "h", mods = "SUPER|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "l", mods = "SUPER|SHIFT", action = act.ActivateTabRelative(1) },

	-- Split panes
	{ key = ".", mods = "SUPER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "/", mods = "SUPER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- Navigate panes
	{ key = "h", mods = "SUPER", action = act.ActivatePaneDirection("Left") },
	{ key = "l", mods = "SUPER", action = act.ActivatePaneDirection("Right") },
	{ key = "j", mods = "SUPER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "SUPER", action = act.ActivatePaneDirection("Up") },

	-- Adjust pane sizes
	{ key = "h", mods = "SUPER|ALT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "l", mods = "SUPER|ALT", action = act.AdjustPaneSize({ "Right", 1 }) },
	{ key = "j", mods = "SUPER|ALT", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "k", mods = "SUPER|ALT", action = act.AdjustPaneSize({ "Up", 1 }) },

	-- No Ops
	-- { key = "H", mods = "CTRL", action = act.Nop },
	-- { key = "L", mods = "CTRL", action = act.Nop },
	-- { key = "J", mods = "CTRL", action = act.Nop },
	-- { key = "K", mods = "CTRL", action = act.Nop },
}

function key_module.apply(config)
	config.keys = keys
end

return key_module
