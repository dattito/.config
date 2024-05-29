return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	cmd = "Oil",
	opts = {
		skip_confirm_for_simple_edits = true,
		show_hidden = true,
	},
	keys = {
		{ "-", "<cmd>Oil<cr>", "open file explorer" },
		{
			"<leader>-",
			function()
				require("oil").close()
			end,
			"open file explorer",
		},
	},
}
