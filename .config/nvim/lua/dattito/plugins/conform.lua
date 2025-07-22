return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<leader>fm",
      function()
        vim.lsp.buf.format({ async = true })
        require("conform").format({ async = true })
      end,
      desc = "LSP formatting",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      rust = { "rustfmt", lsp_format = "fallback" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      go = { "goimports-reviser" },
    },
  },
}
