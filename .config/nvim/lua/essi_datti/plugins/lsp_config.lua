return {
	"neovim/nvim-lspconfig",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"b0o/schemastore.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	keys = {
		{ "<leader>lr", "<CMD> LspRestart<CR>", "Restart LSP" },
		{
			"<leader>q",
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},
		{
			"gd",
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},
		{
			"gi",
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},
		{
			"gr",
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},
		{
			"<leader>ca",
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
		{
			"gD",
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},
		{
			"<leader>lf",
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},
		{
			"<leader>ra",
			function()
				vim.lsp.buf.rename()
			end,
			"Rename variable",
		},
		{
			"[d",
			function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end,
			"Goto prev",
		},

		{
			"]d",
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},
	},
	config = function()
		require("mason").setup()

		--local on_attach = function(client, bufnr)
		--  utils.load_mappings("lspconfig", { buffer = bufnr })
		--  if client.server_capabilities.signatureHelpProvider then
		--    require("nvchad.signature").setup(client)
		--  end
		--end
		local on_attach = function() end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}

		-- capabilities.textDocument.completion.completionItem = {
		--   documentationFormat = { "markdown", "plaintext" },
		--   snippetSupport = true,
		--   preselectSupport = true,
		--   insertReplaceSupport = true,
		--   labelDetailsSupport = true,
		--   deprecatedSupport = true,
		--   commitCharactersSupport = true,
		--   tagSupport = { valueSet = { 1 } },
		--   resolveSupport = {
		--     properties = {
		--       "documentation",
		--       "detail",
		--       "additionalTextEdits",
		--     },
		--   },
		-- }

		require("mason-lspconfig").setup({
			ensure_installed = nil,
			automatic_installation = {
				exclude = {
					"rust_analyzer",
				},
			},
		})

		local lspconfig = require("lspconfig")
		local util = require("lspconfig/util")

		local servers = {
			"html",
			"cssls",
			"tsserver",
			"clangd",
			"texlab",
			"eslint",
			"marksman",
			"tailwindcss",
			"pyright",
			"ruff_lsp",
			"sqlls",
			"terraformls",
		}

		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				handlers = handlers,
			})
		end

		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
			handlers = handlers,

			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
							[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
							[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		})

		lspconfig.gopls.setup({
			capabilities = capabilities,
			handlers = handlers,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		lspconfig.rust_analyzer.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = handlers,
			filetypes = { "rust" },
			root_dir = util.root_pattern("Cargo.toml"),
			settings = {
				["rust-analyzer"] = {
					check = {
						features = "all",
						command = "clippy",
					},
					diagnostics = {
						experimental = {
							enable = true,
						},
					},
					cachePriming = {
						enable = false,
					},
				},
			},
		})

		lspconfig.typst_lsp.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = handlers,
			settings = {
				exportPdf = "onType", -- Choose onType, onSave or never.
				-- serverPath = "" -- Normally, there is no need to uncomment it.
			},
		})

		lspconfig.jsonls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = handlers,
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
				},
			},
		})

		lspconfig.yamlls.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			handlers = handlers,
			settings = {
				yaml = {
					schemaStore = {
						-- You must disable built-in schemaStore support if you want to use
						-- this plugin and its advanced options like `ignore`.
						enable = false,
						-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
						url = "",
					},
					schemas = require("schemastore").yaml.schemas(),
				},
			},
		})
	end,
}
