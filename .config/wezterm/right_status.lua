local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window, pane)
	-- Gets the basename from a string
	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end

	-- Current working directory
	local cwd = pane:get_current_working_dir()
	if cwd then -- cwd can be nil
		-- Check if the cwd is a URI object or a plain string
		if type(cwd) == "userdata" then
			cwd = basename(cwd.file_path)
		else
			cwd = basename(cwd)
		end
	else -- nil fallback
		cwd = ""
	end
	wezterm.log_info(cwd)

	-- Current process
	local cmd = pane:get_foreground_process_name()
	cmd = cmd and basename(cmd) or "" -- nil fallback

	-- Current time
	local time = wezterm.strftime("%l:%M")

	window:set_right_status(wezterm.format({
		-- Current directory
		{ Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
		{ Text = " | " },

		-- Current command or process
		{ Foreground = { Color = "#e0af68" } },
		{ Text = wezterm.nerdfonts.fa_code .. " " .. cmd },
		"ResetAttributes",
		{ Text = " | " },

		-- Current time
		{ Text = wezterm.nerdfonts.md_clock .. " " .. time },
		{ Text = " " },
	}))
end)

return {}
