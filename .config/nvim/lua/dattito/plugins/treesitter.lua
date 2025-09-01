return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	config = function()
		vim.filetype.add({
			extension = { ["ju.py"] = "jupy" },
		})
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			additional_vim_regex_highlighting = false,
			ignore_install = { "latex" },
			autotag = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
		})
	end,
}
