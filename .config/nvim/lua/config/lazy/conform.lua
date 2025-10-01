return {
	"stevearc/conform.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local format_options = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 1000,
		}

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				markdown = { "prettierd" },
				lua = { "stylua" },
				sql = { "sql_formatter" },
				python = {
					"ruff_fix",
					"ruff_format",
					"ruff_organize_imports",
				},
				rust = { "rustfmt", lsp_format = "fallback" },
			},
			format_on_save = format_options,
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format(format_options)
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
