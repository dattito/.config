local excluded_files = "{.git,node_modules,target,dist}"

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			"Find files",
		},
		{
			"<leader>fa",
			"<cmd>Telescope Telescope find_files follow=true no_ignore=true hidden=true <cr>",
			"Find all files",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			"Find buffers",
		},
		{
			"<leader>fw",
			"<cmd>Telescope live_grep<cr>",
			"Live grep",
		},
		{
			"<leader>fz",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			"Live grep current file",
		},
	},
	cmd = "Telescope",
	opts = {
		defaults = {
			vimgrep_arguments = {
				"rg",
				"-L",
				"--hidden",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--glob",
				"!" .. excluded_files,
			},
		},
		pickers = {
			find_files = {
				find_command = {
					"fd",
					"--type",
					"f",
					"--strip-cwd-prefix",
					"--hidden",
					"-E",
					excluded_files,
				},
			},
		},
	},
}