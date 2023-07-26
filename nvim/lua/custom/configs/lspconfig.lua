local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local servers = { "html", "cssls", "tsserver", "clangd", "yamlls", "texlab", "eslint", "marksman"}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.yamlls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  ft = "yaml"
})

lspconfig.gopls.setup({
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
      }
    }
  }
})

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  ft = "lua"
})
