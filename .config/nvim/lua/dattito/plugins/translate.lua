return {
	"uga-rosa/translate.nvim",
	cmd = "Translate",
	config = function()
		require("translate").setup({
			default = {
				output = "register",
			},
			preset = {
				output = {
					split = {
						append = true,
					},
				},
			},
		})
	end,
	init = function()
		-- Normal mode mappings
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tdy",
			"<cmd> Translate DE<CR>",
			{ noremap = true, silent = true, desc = "Translate and yank word under cursor to German" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tey",
			"<cmd> Translate EN<CR>",
			{ noremap = true, silent = true, desc = "Translate and yank word under cursor to English" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tds",
			"<cmd> Translate DE -output=floating<CR>",
			{ noremap = true, silent = true, desc = "Translate and show word under cursor to German" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tes",
			"<cmd> Translate EN -output=floating<CR>",
			{ noremap = true, silent = true, desc = "Translate and show word under cursor to English" }
		)

		-- Visual mode mappings
		vim.api.nvim_set_keymap(
			"v",
			"<leader>tdy",
			"<cmd> Translate DE<CR>",
			{ noremap = true, silent = true, desc = "Translate and yank word under cursor to German" }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>tey",
			"<cmd> Translate EN<CR>",
			{ noremap = true, silent = true, desc = "Translate and yank word under cursor to English" }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>tds",
			"<cmd> Translate DE -output=floating<CR>",
			{ noremap = true, silent = true, desc = "Translate and show word under cursor to German" }
		)
		vim.api.nvim_set_keymap(
			"v",
			"<leader>tes",
			"<cmd> Translate EN -output=floating<CR>",
			{ noremap = true, silent = true, desc = "Translate and show word under cursor to English" }
		)
	end,
}
