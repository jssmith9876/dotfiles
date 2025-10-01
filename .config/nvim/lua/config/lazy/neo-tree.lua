return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		{
			"s1n7ax/nvim-window-picker",
			version = "2.*",
			config = function()
				require("window-picker").setup({
					show_prompt = false,
					filter_rules = {
						include_current_win = false,
						autoselect_one = true,
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { "neo-tree", "neo-tree-popup", "notify" },
							-- if the buffer type is one of following, the window will be ignored
							buftype = { "terminal", "quickfix" },
						},
					},
				})
			end,
		},
	},
	config = function()
		local toggle_tree = function()
			require("neo-tree.command").execute({
				toggle = true,
				position = "left",
			})
		end

		require("neo-tree").setup({
			close_if_last_window = true,
			window = {
				mappings = {
					["<C-b>"] = toggle_tree,
					["<cr>"] = "open_with_window_picker",
				},
			},
			filesystem = {
				filtered_items = {
					visible = true,
					hide_dotfiles = false,
				},
				follow_current_file = { enabled = true },
			},
		})

		vim.keymap.set("n", "<C-b>", toggle_tree)
	end,
}
