return {
	"saecki/crates.nvim",
	event = { "BufRead Cargo.toml" },
	tag = "v0.4.0",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("crates").setup({
			src = {
				cmp = {
					enabled = true,
				},
			},
		})

		local function show_documentation()
			local filetype = vim.bo.filetype
			if vim.tbl_contains({ "vim", "help" }, filetype) then
				vim.cmd("h " .. vim.fn.expand("<cword>"))
			elseif vim.tbl_contains({ "man" }, filetype) then
				vim.cmd("Man " .. vim.fn.expand("<cword>"))
			elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
				require("crates").show_popup()
			else
				vim.lsp.buf.hover()
			end
		end

		vim.keymap.set("n", "K", show_documentation, { silent = true })
	end,
}
