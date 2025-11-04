return {
	"Vigemus/iron.nvim",
	cmd = {
		"IronRepl",
		"IronReplHere",
		"IronRestart",
		"IronSend",
		"IronFocus",
		"IronHide",
		"IronWatch",
		"IronAttach",
	},
	keys = {
		"<space>sc",
		"<space>sb",
		"<space>sf",
		"<space>sl",
		"<space>su",
		"<space>sm",
		"<space>mc",
		"<space>mc",
		"<space>md",
		"<space>s<cr>",
		"<space>s<space>",
		"<space>sq",
		"<space>cl",

		{ "<space>rs", "<cmd>IronRepl<cr>" },
		{ "<space>rR", "<cmd>IronRestart<cr>" },
		{ "<space>rf", "<cmd>IronFocus<cr>" },
		{ "<space>rh", "<cmd>IronHide<cr>" },
	},
	config = function()
		local iron = require("iron.core")
		local view = require("iron.view")
		local common = require("iron.fts.common")

		iron.setup({
			config = {
				scratch_repl = true,
				repl_definition = {
					sh = {
						command = { "fish" },
					},
					python = {
            command = { "ipython", "--no-autoindent" },
						format = common.bracketed_paste_python,
						block_dividers = { "# %%", "#%%" },
            env = {PYTHON_BASIC_REPL = "1"}
					},
				},
				-- set the file type of the newly created repl to ft
				-- bufnr is the buffer id of the REPL and ft is the filetype of the
				-- language being used for the REPL.
				repl_filetype = function(bufnr, ft)
					return ft
					-- or return a string name such as the following
					-- return "iron"
				end,
				repl_open_cmd = view.split.vertical.botright("40%"),
			},
			keymaps = {
				toggle_repl = "<space>re", -- toggles the repl open and closed.
				-- If repl_open_command is a table as above, then the following keymaps are
				-- available
				-- toggle_repl_with_cmd_1 = "<space>rv",
				-- toggle_repl_with_cmd_2 = "<space>rh",
				restart_repl = "<space>rR",
				send_motion = "<space>sc",
				visual_send = "<space>sc",
				send_file = "<space>sf",
				send_line = "<space>sl",
				send_paragraph = "<space>sp",
				send_until_cursor = "<space>su",
				send_mark = "<space>sm",
				send_code_block = "<space>sb",
				send_code_block_and_move = "<space>sn",
				mark_motion = "<space>mc",
				mark_visual = "<space>mc",
				remove_mark = "<space>md",
				cr = "<space>s<cr>",
				interrupt = "<space>s<space>",
				exit = "<space>sq",
				clear = "<space>cl",
			},
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true,
		})

		vim.keymap.set("n", "<space>rf", "<cmd>IronFocus<cr>")
		vim.keymap.set("n", "<space>rh", "<cmd>IronHide<cr>")
	end,
}
