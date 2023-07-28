local null_ls = require "null-ls"

local sources = {
  null_ls.builtins.formatting.gofumpt,
  null_ls.builtins.formatting.goimports_reviser,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua,
  null_ls.builtins.formatting.latexindent,
  -- null_ls.builtins.formatting.xo,

  -- null_ls.builtins.diagnostics.eslint,
}

null_ls.setup {
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
}

require("mason-null-ls").setup {
  ensure_installed = nil,
  automatic_installation = true,
}
