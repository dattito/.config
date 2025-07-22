return {
  "neovim/nvim-lspconfig",
event = { "BufWritePost", "BufReadPost", "InsertLeave" },
  dependencies = {
    {
      "mason-org/mason.nvim",
    },
    { "mason-org/mason-lspconfig.nvim" },
    "b0o/schemastore.nvim",
  },
  config = function()
    require("mason").setup()

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup({
      ensure_installed = nil,
      automatic_installation = {
        exclude = {
          "rust_analyzer",
        },
      },
    })

    local util = require("lspconfig/util")

    local servers = {
      dartls = {
        cmd = { "dart", "language-server", "--protocol=lsp" },
      },
      html = {},
      cssls = {},
      ts_ls = {},
      emmet_language_server = {},
      clangd = {
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
      },
      texlab = {},
      eslint = {
        format = false,
      },
      marksman = {},
      tailwindcss = {},
      pyright = {},
      ruff = {},
      prismals = {},
      sqlls = {},
      terraformls = {},
      gleam = {},
      lua_ls = {
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
      },
      gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            gofumpt = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
      rust_analyzer = {
        filetypes = { "rust" },
        root_dir = util.root_pattern("Cargo.lock"),
        settings = {
          ["rust-analyzer"] = {
            check = {
              features = "all",
              command = "clippy",
            },
            diagnostics = {
              refreshSupport = true,
              experimental = {
                enable = true,
              },
            },
            cachePriming = {
              enable = false,
            },
          },
        },
      },
      tinymist = {
        settings = {
          exportPdf = "onType", -- Choose onType, onSave or never.
          -- serverPath = "" -- Normally, there is no need to uncomment it.
        },
      },
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
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
      },
    }

    local lspconfig = require("lspconfig")

    for name, opts in pairs(servers) do
      opts.capabilities = capabilities
      -- opts.on_attach = on_attach
      -- opts.handlers = handlers

      lspconfig[name].setup(opts)
    end

    -- vim.api.nvim_command("LspStart")
  end,
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
        vim.diagnostic.jump({ count = -1, float = { border = "rounded" } })
      end,
      "Goto prev",
    },

    {
      "]d",
      function()
        vim.diagnostic.jump({ count = 1, float = { border = "rounded" } })
      end,
      "Goto next",
    },
  },
}
