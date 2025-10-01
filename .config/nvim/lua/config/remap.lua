local map = vim.keymap.set
local defaults = { noremap = true, silent = true }

-- Open file explorer
map("n", "<leader>ef", vim.cmd.Ex)

-- Block move
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Center cursor on page jumps
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Center cursor while searching
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Change block jumps to jump 10 lines in each direction
map("n", "{", "10kzz")
map("n", "}", "10jzz")
map("v", "{", "10kzz")
map("v", "}", "10jzz")

-- Copy values to the clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Easy escape
map("i", "jj", "<Esc>", defaults)

-- Pane management
map("n", "<CA-l>", "<Cmd>vertical resize +1<CR>", defaults)
map("n", "<CA-h>", "<Cmd>vertical resize -1<CR>", defaults)
map("n", "<CA-k>", "<Cmd>resize +1<CR>", defaults)
map("n", "<CA-j>", "<Cmd>resize -1<CR>", defaults)

-- Search and replace the currently highlighted word
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Insert new lines without going into insert mode
map("n", "<leader>o", ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', defaults)
map("n", "<leader>O", ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', defaults)

--
-- LSP stuff
--

-- Goto declaration/definition
map("n", "<leader>gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", defaults)
map("n", "<leader>gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", defaults)

map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", defaults)

-- View full diagnostic
map("n", "<leader>ve", function()
	vim.diagnostic.open_float()
end)
