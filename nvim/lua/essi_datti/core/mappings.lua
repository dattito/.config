-- Copy everything
vim.api.nvim_set_keymap("n", "<C-c>", "<cmd>%y+ <CR>", { noremap = true, silent = true })

-- Movement
vim.api.nvim_set_keymap("n", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })

vim.api.nvim_set_keymap("x", "j", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("x", "k", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })

-- > and <
vim.api.nvim_set_keymap("v", "<Up>", 'v:count == 0 ? "gk" : "k"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Down>", 'v:count == 0 ? "gj" : "j"', { expr = true, noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

-- Don't copy pasted text
vim.api.nvim_set_keymap("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', { noremap = true, silent = true })
