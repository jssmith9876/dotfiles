return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				disabled_filetypes = { "NvimTree" },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				theme = "palenight",
			},
			sections = {
				lualine_b = {},
				lualine_x = { "filetype" },
			},
		})
	end,
}
