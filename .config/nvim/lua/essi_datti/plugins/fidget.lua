-- To display lsp logs in the botom right corner of the screen (mostly for rust-analyzer)
return {
  "j-hui/fidget.nvim",
  lazy = false,
  opts = {

    notification = {

      window = {
        max_height = 3,
        winblend = 0,
      },
    },

    -- options
  },
}
