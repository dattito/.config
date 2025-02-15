return {
	"danielfalk/smart-open.nvim",
	branch = "0.3.x",
  cmd = "Telescope",
	dependencies = {
		"kkharji/sqlite.lua",
		"nvim-telescope/telescope-fzy-native.nvim",
    "nvim-telescope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("smart_open")
	end,
	keys = {
		{
			"<leader><leader>",
			function()
				require("telescope").extensions.smart_open.smart_open({
					match_algorithm = "fzy",
				})
			end,
			desc = "Find files",
		},
	},
}
