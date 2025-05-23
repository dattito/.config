return {
	"iguanacucumber/magazine.nvim",
	name = "nvim-cmp", -- Otherwise highlighting gets messed up
	dependencies = {
		"neovim/nvim-lspconfig",

		{ "https://codeberg.org/FelipeLema/cmp-async-path", name = "cmp-path" },
		{ "iguanacucumber/mag-nvim-lsp", name = "cmp-nvim-lsp", opts = {} },
		{ "iguanacucumber/mag-nvim-lua", name = "cmp-nvim-lua" },
		{ "iguanacucumber/mag-buffer", name = "cmp-buffer" },
		{ "iguanacucumber/mag-cmdline", name = "cmp-cmdline" },

		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",

		"onsails/lspkind.nvim",
	},
	event = "InsertEnter",
	config = function()
		local cmp = require("cmp")

		local border = {
			"╭",
			"─",
			"╮",
			"│",
			"╯",
			"─",
			"╰",
			"│",
		}

		-- https://github.com/windwp/nvim-autopairs?tab=readme-ov-file#you-need-to-add-mapping-cr-on-nvim-cmp-setupcheck-readmemd-on-nvim-cmp-repo
		--   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		cmp.setup({
			sources = cmp.config.sources({
				-- { name = "crates" },
				{ name = "nvim_lsp" },
				{ name = "lazydev" },
				{ name = "copilot" },
				{ name = "luasnip" },
				-- { name = "nvim_lua" },
				{ name = "path" },
				{ name = "omni" },
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = {
					-- border = "rounded",
					winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None,CursorLine:PmenuSel",
					col_offset = -3,
					side_padding = 0,
					border = border,
				},

				documentation = {
					border = border,
					winhighlight = "Normal:CmpDoc",
				},
			},
			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-d>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				}),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif require("luasnip").expand_or_jumpable() then
						vim.fn.feedkeys(
							vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
							""
						)
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif require("luasnip").jumpable(-1) then
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
					else
						fallback()
					end
				end, {
					"i",
					"s",
				}),
			}),
		})
	end,
}
