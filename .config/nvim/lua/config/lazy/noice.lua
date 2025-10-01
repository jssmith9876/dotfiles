return {
	"folke/noice.nvim",
	dependencies = {
		"rcarriga/nvim-notify",
	},
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})

		require("noice").setup({
			messages = { enabled = false },
			views = {
				notify = {
					replace = true,
				},
			},
			lsp = {
				hover = {
					-- Set not show a message if hover is not available
					silent = true,
				},
				progress = {
					view = "notify",
				},
				signature = {
					auto_open = {
						enabled = false,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
				},
			},
			routes = {
				-- Disable "written" messages
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
				-- Disable
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
					},
					opts = { skip = true },
				},
			},
			presets = {
				command_palette = true,
				lsp_doc_border = true,
			},
		})
	end,
}
