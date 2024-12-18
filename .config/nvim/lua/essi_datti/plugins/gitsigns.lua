return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = function()
    require("gitsigns").setup()
  end,
  keys = {
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "git blame line" },
  },
}
