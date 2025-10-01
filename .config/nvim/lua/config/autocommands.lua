local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
	desc = "Update formatoptions to not continue comments on next line",
	callback = function()
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
	group = autocmd_group,
})
