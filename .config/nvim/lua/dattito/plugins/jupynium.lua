return {
	"kiyoon/jupynium.nvim",
	build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
	ft = "python",
	opts = {
		python_host = { "uv", "run", "--python", "/Users/I568850/.virtualenvs/jupynium/bin/python", "python3" },
		jupyter_command = { "uv", "run", "--python", "/Users/I568850/.virtualenvs/jupynium/bin/python", "jupyter" },
		use_default_keybindings = false,
		auto_start_server = {
			enable = true,
			file_pattern = { "*.ju.*" },
		},
		auto_attach_to_server = {
			enable = true,
			file_pattern = { "*.ju.*" },
		},
		auto_start_sync = {
			enable = true,
			file_pattern = { "*.ju.*" },
		},
	},
	keys = {
		{ "<leader>jja", "<cmd>JupyniumStartAndAttachToServer<cr>", desc = "jupynium start and attach to server" },
		{ "<leader>jjs", "<cmd>JupyniumStartSync<cr>", desc = "jupynium start sync" },
		{ "<leader>jjq", "<cmd>JupyniumStopSync<cr>", desc = "jupynium stop sync" },
		{
			"<leader>js",
			"<cmd>JupyniumExecuteSelectedCells<cr>",
			desc = "jupynium execute selected cells",
			mode = { "n", "v" },
		},
	},
}
