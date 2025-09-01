return {
	"https://git.sr.ht/~swaits/zellij-nav.nvim",
	keys = {
		{
			"<c-h>",
			"<cmd>ZellijNavigateLeft<cr>",
			{ silent = true, desc = "navigate left" },
			mode = { "i", "n", "v" },
		},
		{
			"<c-j>",
			"<cmd>ZellijNavigateDown<cr>",
			{ silent = true, desc = "navigate down" },
			mode = { "i", "n", "v" },
		},

		{
			"<c-k>",
			"<cmd>ZellijNavigateUp<cr>",
			{ silent = true, desc = "navigate up" },
			mode = { "i", "n", "v" },
		},
		{
			"<c-l>",
			"<cmd>ZellijNavigateRight<cr>",
			{ silent = true, desc = "navigate right" },

			mode = { "i", "n", "v" },
		},
	},
	opts = {},
}
