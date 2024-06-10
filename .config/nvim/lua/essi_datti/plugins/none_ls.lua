return {
	"jay-babu/mason-null-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"nvimtools/none-ls.nvim",
	},
	keys = {
		{
			"<leader>fm",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "LSP formatting",
		},
	},
	config = function()
		local null_ls = require("null-ls")

		local sources = {
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports_reviser,
			null_ls.builtins.formatting.prettierd,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.black,
			null_ls.builtins.diagnostics.sqlfluff.with({
				extra_args = { "--dialect", "postgres" }, -- change to your dialect
			}),
			null_ls.builtins.formatting.sqlfluff,
			null_ls.builtins.formatting.terraform_fmt,
			null_ls.builtins.formatting.typstfmt,
			null_ls.builtins.diagnostics.terraform_validate,
		}

		null_ls.setup({
			sources = sources,
			on_attach = function(client, bufnr) end,
		})

		require("mason-null-ls").setup({
			ensure_installed = nil,
			automatic_installation = {
				exclude = {
					"rustfmt",
				},
			},
		})
	end,
}
