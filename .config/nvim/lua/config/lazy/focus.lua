return {
	"nvim-focus/focus.nvim",
	version = false,
	config = function()
		local focus = require("focus")

		local function directionalKeyMap(direction)
			vim.keymap.set("n", "<C-" .. direction .. ">", function()
				focus.split_command(direction)
			end, { desc = string.format("Create or move to split (%s)", direction) })
		end

		directionalKeyMap("h")
		directionalKeyMap("j")
		directionalKeyMap("k")
		directionalKeyMap("l")
	end,
}
