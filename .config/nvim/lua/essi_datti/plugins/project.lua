return {
	"ahmedkhalf/project.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			scope_chdir = "tab",
			detection_methods = { "pattern" },
		})
		require("telescope").load_extension("projects")
	end,
	keys = {
		{
			"<leader>fp",
			function()
				require("telescope").extensions.projects.projects({})
			end,
			desc = "Find all projects",
		},
	},
}
