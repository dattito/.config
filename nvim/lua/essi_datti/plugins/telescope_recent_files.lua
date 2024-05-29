return {
	"smartpde/telescope-recent-files",
	dependencies = "nvim-telescope/telescope.nvim",
	config = function()
		require("telescope").load_extension("recent_files")
	end,
	keys = {
		{
			"<leader>fo",
			function()
				require("telescope").extensions.recent_files.pick()
			end,
			desc = "Find recent files",
		},
	},
}
