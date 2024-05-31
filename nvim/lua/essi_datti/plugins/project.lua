return {
	"ahmedkhalf/project.nvim",
	dependencies = "nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	config = function()
		require("project_nvim").setup({
			scope_chdir = "tab",
			detection_methods = { "pattern" },
		})
	end,
}
