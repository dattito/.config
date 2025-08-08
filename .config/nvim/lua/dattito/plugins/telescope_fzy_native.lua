return {
	"nvim-telescope/telescope-fzy-native.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = function()
		require("telescope").setup({
			extensions = {
				fzy_native = {
					override_generic_sorter = true,
					override_file_sorter = true,
				},
			},
		})
		require("telescope").load_extension("fzy_native")
	end,
}
