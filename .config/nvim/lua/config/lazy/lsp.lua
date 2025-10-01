return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		--
		-- START MASON SETUP
		--
		local mason_lspconfig = require("mason-lspconfig")
		require("mason").setup()

		mason_lspconfig.setup({
			-- Default handler
			function(server_name)
				require("lspconfig")[server_name].setup()
			end,

			-- Python
			-- ["pyright"] = function()
			-- 	require("lspconfig").pyright.setup({
			-- 		settings = {
			-- 			pylsp = {
			-- 				plugins = {
			-- 					pyls_black = { enabled = true },
			-- 					isort = { enabled = true, profile = "black" },
			-- 				},
			-- 			},
			-- 		},
			-- 	})
			-- end,

			-- Lua
			["lua_ls"] = function()
				require("lspconfig").lua_ls.setup({
					on_init = function(client)
						local path = client.workspace_folders[1].name
						if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
							return
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
									"${3rd}/luv/library",
								},
							},
						})
					end,
					settings = {
						Lua = {},
					},
				})
			end,
		})
		--
		-- END MASON SETUP
		--

		--
		-- START CMP SETUP
		--
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		-- Check if we have words before this cursor
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<Tab>"] = cmp.mapping(function(fallback)
					-- Allows for tab to be multi-functional (perform both traditional tab and completion)
					-- See https://github.com/LazyVim/LazyVim/discussions/39#discussioncomment-5994968
					if cmp.visible() then
						cmp.confirm({ select = true })
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end),
			}),
			sources = cmp.config.sources({
				{
					name = "nvim_lsp",
					-- Filter out snippets from the LSP completions
					entry_filter = function(entry)
						return cmp.lsp.CompletionItemKind.Snippet ~= entry:get_kind()
					end,
				}, -- Neovim LSP
				{ name = "async_path" }, -- Paths
			}),
		})
		--
		-- END CMP SETUP
		--

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
