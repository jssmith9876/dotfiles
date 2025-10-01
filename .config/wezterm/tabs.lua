local wezterm = require("wezterm")
local tabs_module = {}

local function tab_title(tab_info)
	local title = tab_info.tab_title

	-- If the tab title is explicitly set, use that
	if title and #title > 0 then
		return title
	end

	return tab_info.active_pane.title
end

function tabs_module.apply(config)
	config.use_fancy_tab_bar = false
	config.enable_tab_bar = true
	config.hide_tab_bar_if_only_one_tab = true
	config.tab_bar_at_bottom = true
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover)
	local base_background = "#1b1032"
	local base_foreground = "#808080"

	local background = base_background
	local foreground = base_foreground

	local edge_color = "#ffffff"

	if tab.is_active then
		background = "#c591ff"
		foreground = "#333333"
	elseif hover then
		background = "#3b3052"
		foreground = "#909090"
	end

	local title = tab_title(tab)

	return {
		{ Background = { Color = base_background } },
		{ Foreground = { Color = edge_color } },
		{ Text = tab.tab_index == 0 and "" or "|" },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. tab.tab_index + 1 .. ": " .. title .. " " },
	}
end)

return tabs_module
