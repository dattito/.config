return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	event = { "BufNewFile", "BufRead" },
	opts = {
		width = 120,
		mappings = {
			enabled = true,
		},
		autocmds = {
			enableOnVimEnter = true,
		},
		buffers = {
			wo = {
				fillchars = "eob: ",
			},
		},
	},
}
