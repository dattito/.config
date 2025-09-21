-- Copy everything
vim.keymap.set("n", "<C-c>", "<cmd>%y+ <CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", { noremap = true, silent = true })

-- Show diagnostics in floating window
vim.keymap.set("n", "<leader>w", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true })

-- Movement
vim.keymap.set("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.keymap.set("n", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })

vim.keymap.set("x", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.keymap.set("x", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })

-- > and <
vim.keymap.set("v", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.keymap.set("v", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Don't copy pasted text
vim.keymap.set("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>oi", function()
	print(vim.fn.getcwd())
end, { desc = "Print CWD", noremap = true, expr = true })

-- LSP keybindings
vim.keymap.set("n", "<leader>lr", "<CMD> LspRestart<CR>", { desc = "Restart LSP", noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist", noremap = true, silent = true })
vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "LSP definition", noremap = true, silent = true })
vim.keymap.set("n", "gi", function()
	vim.lsp.buf.implementation()
end, { desc = "LSP implementation", noremap = true, silent = true })
vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references()
end, { desc = "LSP references", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP code action", noremap = true, silent = true })
vim.keymap.set("n", "gD", function()
	vim.lsp.buf.declaration()
end, { desc = "LSP declaration", noremap = true, silent = true })
vim.keymap.set("n", "<leader>lf", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic", noremap = true, silent = true })
vim.keymap.set("n", "<leader>ra", function()
	vim.lsp.buf.rename()
end, { desc = "Rename variable", noremap = true, silent = true })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
end, { desc = "Goto prev", noremap = true, silent = true })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
end, { desc = "Goto next", noremap = true, silent = true })
