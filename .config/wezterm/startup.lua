local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function(cmd)
	local _, _, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()

	-- pane:split({
	-- 	direction = "Right",
	-- 	size = 0.33,
	-- })
	-- pane:split({
	-- 	direction = "Down",
	-- 	size = 0.5,
	-- })
end)
