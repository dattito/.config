return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "b0o/schemastore.nvim",
    {
      "lukas-reineke/lsp-format.nvim",
      config = function()
        require("lsp-format").setup({})
      end,
    },
  },
  config = function()
    require("mason").setup()

    require("lsp-format").setup({})
    local on_attach = function(client, bufnr)
      -- require("lsp-format").on_attach(client, bufnr)
    end

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local handlers = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

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
      pyright = {
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      },
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
        capabilities = capabilities,
        handlers = handlers,
        on_attach = on_attach,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gopls = {
            gofumpt = true,
            completeUnimported = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      },
      rust_analyzer = {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        filetypes = { "rust" },
        root_dir = util.root_pattern(".git"),
        settings = {
          ["rust-analyzer"] = {
            check = {
              features = "all",
              command = "clippy",
            },
            diagnostics = {
              refreshSupport = false,
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
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        settings = {
          exportPdf = "onType", -- Choose onType, onSave or never.
          -- serverPath = "" -- Normally, there is no need to uncomment it.
        },
      },
      jsonls = {
        capabilities = capabilities,
        on_attach = on_attach,
        handlers = handlers,
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      yamlls = {
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
      },
    }

    local lspconfig = require("lspconfig")

    for name, opts in pairs(servers) do
      opts.on_attach = on_attach
      opts.capabilities = capabilities
      opts.handlers = handlers

      lspconfig[name].setup(opts)
    end

    vim.api.nvim_command("LspStart")
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
}
