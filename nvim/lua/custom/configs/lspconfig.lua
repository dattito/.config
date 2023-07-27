local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

require("mason-lspconfig").setup {
  ensure_installed = nil,
  automatic_installation = true,
}

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = { "html", "cssls", "tsserver", "clangd", "yamlls", "texlab", "eslint", "marksman", "lua_ls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

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
