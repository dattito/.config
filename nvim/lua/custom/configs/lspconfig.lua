local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("mason-lspconfig").setup {
  ensure_installed = nil,
  automatic_installation = {
    exclude = {
      "rust_analyzer",
    },
  },
}

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = {
  "html",
  "cssls",
  "tsserver",
  "clangd",
  "texlab",
  "eslint",
  "marksman",
  "yamlls",
  "tailwindcss",
  "pyright",
  "sqlls",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.gopls.setup {
  capabilities = capabilities,
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
}

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "rust" },
  root_dir = util.root_pattern "Cargo.toml",
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
}

lspconfig.typst_lsp.setup {
  settings = {
    exportPdf = "onType", -- Choose onType, onSave or never.
    -- serverPath = "" -- Normally, there is no need to uncomment it.
  },
}
