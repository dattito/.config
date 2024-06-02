-- Copy everything
vim.keymap.set("n", "<C-c>", "<cmd>%y+ <CR>", { noremap = true, silent = true })

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
